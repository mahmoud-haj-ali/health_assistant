import 'package:haelth_app/core/data_base/tables/analysis_name_t.dart';
import 'package:haelth_app/core/data_base/tables/analysis_t.dart';
import 'package:haelth_app/core/data_base/tables/date_t.dart';
import 'package:haelth_app/core/data_base/tables/diet_t.dart';
import 'package:haelth_app/core/data_base/tables/doctor_t.dart';
import 'package:haelth_app/core/data_base/tables/food_diet_t.dart';
import 'package:haelth_app/core/data_base/tables/food_t.dart';
import 'package:haelth_app/core/data_base/tables/medicine_diet_t.dart';
import 'package:haelth_app/core/data_base/tables/medicine_t.dart';
import 'package:haelth_app/core/data_base/tables/medicine_reminder_t.dart';
import 'package:haelth_app/core/notifications/notifications_servece.dart';

import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'moor_db.g.dart';

@UseMoor(tables: [Doctors, AnalysisNames, Analysises, Dates, Diets, Medicines, Foods, MedicineReminders, MedicineDiets, FoodDiets])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sql'));
    return VmDatabase(file,logStatements: true);
  }));


  Future<List<Doctor>> get getAllDoctors => select(doctors).get();
  Future<List<AnalysisName>> get getAllAnalysisNames => select(analysisNames).get();
  Future<List<Diet>> get getAllDiets => select(diets).get();
  Future<List<Medicine>> get getAllMedicines => select(medicines).get();
  Future<List<Food>> get getAllFoods => select(foods).get();
  Future<List<Medicine>> getDoctorMedicines(int doctorId) => (select(medicines)..where((tbl) => tbl.doctorId.equals(doctorId))).get();
  Future<List<Analysis>> getDoctorAnalysis(int doctorId) => (select(analysises)..where((tbl) => tbl.doctorId.equals(doctorId))).get();
  Future<List<Analysis>> getAllAnalysis(int nameId) => (select(analysises)..where((tbl) => tbl.nameId.equals(nameId))).get();
  Future<List<MedicineReminder>> getMedicineReminders(medicineId) => (select(medicineReminders)..where((tbl) => tbl.medicineId.equals(medicineId))).get();
  Future<Doctor> getDoctor(int doctorId) => (select(doctors)..where((tbl) => tbl.id.equals(doctorId))).getSingle();
  Future<List<Medicine>> getDietMedicines(int dietId,bool isAllowed) async {
    final query = customSelect(
        'select medicines.* '
        'from medicines, medicine_diets where '
        'medicines.id=medicine_diets.medicine_id '
        'and medicine_diets.diet_id=$dietId and medicine_diets.is_allowed=$isAllowed');
    return (await query.get()).map((e)=>Medicine.fromJson(e.data)).toList();
  }
  Future<List<Food>> getDietFoods(int dietId,bool isAllowed) async {
    final query = customSelect(
        'select foods.* '
        'from foods, food_diets where '
        'foods.id = food_diets.food_id '
        'and food_diets.diet_id=$dietId and food_diets.is_allowed=$isAllowed');
    return (await query.get()).map((e)=>Food.fromJson(e.data)).toList();
  }


  Stream<List<Doctor>> get watchAllDoctors => select(doctors).watch();
  Stream<List<AnalysisName>> get watchAllAnalysisNames => select(analysisNames).watch();
  Stream<List<Diet>> get watchAllDiets => select(diets).watch();
  Stream<List<Medicine>> get watchAllMedicines => select(medicines).watch();
  Stream<List<Food>> get watchAllFoods => select(foods).watch();
  Stream<List> watchAll<T>() async*{
    if(T.toString() == "Food")
      yield* select(foods).watch();
    else if(T.toString() == "Medicine")
      yield* select(medicines).watch();
  }

  Stream<List<Doctor>> watchDoctor(int doctorId) => (select(doctors)..where((t) => t.id.equals(doctorId))).watch();
  Stream<Medicine> watchMedicine(int medicineId) => (select(medicines)..where((t) => t.id.equals(medicineId))).watchSingle();
  Stream<List<Analysis>> watchAllAnalysis(int analysisNameId) => (select(analysises)..where((t) => t.nameId.equals(analysisNameId))).watch();
  Stream<List<Date>> watchAllDoctorDates(int doctorId) => (select(dates)..where((t) => t.doctorId.equals(doctorId))).watch();
  Stream<List<MedicineReminder>> watchAllMedicineReminders(int medicineId) => (select(medicineReminders)..where((t) => t.medicineId.equals(medicineId))).watch();


  Future deleteAnalysis(int id) => (delete(analysises)..where((t)=>t.id.equals(id))).go();
  Future deleteMedicine(int id) => (delete(medicines)..where((t)=>t.id.equals(id))).go();
  Future deleteFood(int id) => (delete(foods)..where((t)=>t.id.equals(id))).go();
  Future deleteDate(int id) async{
    await (delete(dates)..where((t)=>t.id.equals(id))).go();
    localNotification.deleteNotification(id);
  }
  Future deleteDoctor(int id) {
    (delete(dates)..where((tbl) => tbl.doctorId.equals(id))).go();
    return (delete(doctors)..where((t)=>t.id.equals(id))).go();
  }
  Future deleteDiet(int id) async{
    await (delete(diets)..where((t)=>t.id.equals(id))).go();
    return (delete(medicineDiets)..where((t)=>t.dietId.equals(id))).go();
  }
  Future deleteAnalysisName(int id) async{
    await (delete(analysisNames)..where((t)=>t.id.equals(id))).go();
    (delete(analysises)..where((tbl) => tbl.nameId.equals(id))).go();
  }
  Future deleteMedicineReminder(int id) async{
    await (delete(medicineReminders)..where((t)=>t.id.equals(id))).go();
    localNotification.deleteNotification(id);
  }
  Future deleteMedicineReminders(int medicineId) async {
    final list = await (select(medicineReminders)..where((t)=>t.medicineId.equals(medicineId))).get();
    await (delete(medicineReminders)..where((t)=>t.medicineId.equals(medicineId))).go();
    for(var item in list)
      localNotification.deleteNotification(item.id);
  }

  Future updateMedicine(Medicine entry) => update(medicines).replace(entry);
  Future updateDate(Date entry) => update(dates).replace(entry);
  Future updateDoctor(Doctor entry) => update(doctors).replace(entry);
  Future updateDiet(Diet entry) => update(diets).replace(entry);
  Future updateAnalysisName(AnalysisName entry) => update(analysisNames).replace(entry);
  Future updateAnalysis(Analysis entry) => update(analysises).replace(entry);


  Future<int> addMedicine(Medicine entry) => into(medicines).insert(entry);
  Future<int> addFood(Food entry) => into(foods).insert(entry);
  Future<int> addDate(Date entry) => into(dates).insert(entry);
  Future<int> addDoctor(Doctor entry) => into(doctors).insert(entry);
  Future<int> addDiet(Diet entry) => into(diets).insert(entry);
  Future<int> addAnalysisName(AnalysisName entry) => into(analysisNames).insert(entry);
  Future<int> addAnalysis(Analysis entry) => into(analysises).insert(entry);
  Future<int> addDietMedicine(MedicineDiet medicineDiet) => into(medicineDiets).insert(medicineDiet);
  Future<int> addDietFood(FoodDiet foodDiet) => into(foodDiets).insert(foodDiet);
  Future<int> addMedicineReminder(MedicineReminder reminder) async {
    int id = await into(medicineReminders).insert(reminder);
    localNotification.scheduleDailyNotification(id: id,time: reminder.date,title: 'تذكر',body: reminder.content);
    return id;
  }

  @override
  int get schemaVersion => 1;


}