import 'package:haelth_app/core/data_base/tables/analysis_name_t.dart';
import 'package:haelth_app/core/data_base/tables/analysis_t.dart';
import 'package:haelth_app/core/data_base/tables/date_t.dart';
import 'package:haelth_app/core/data_base/tables/diet_t.dart';
import 'package:haelth_app/core/data_base/tables/doctor_t.dart';
import 'package:haelth_app/core/data_base/tables/food_t.dart';
import 'package:haelth_app/core/data_base/tables/medicine_t.dart';
import 'package:haelth_app/core/data_base/tables/notification_t.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';

part 'moor_db.g.dart';

class A {}
@UseMoor(tables: [Doctors, AnalysisNames, Analysises, Dates, Diets, Foods, Medicines, MedicineReminders])
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
  Future<List<Analysis>> getAllAnalysis(int nameId) => (select(analysises)..where((tbl) => tbl.nameId.equals(nameId))).get();
  Future<List<MedicineReminder>> getMedicineReminders(medicineId) => (select(medicineReminders)..where((tbl) => tbl.medicineId.equals(medicineId))).get();

  Stream<List<Doctor>> get watchAllDoctors => select(doctors).watch();
  Stream<List<AnalysisName>> get watchAllAnalysisNames => select(analysisNames).watch();
  Stream<List<Diet>> get watchAllDiets => select(diets).watch();
  Stream<List<Medicine>> get watchAllMedicines => select(medicines).watch();

  Stream<List<Doctor>> watchDoctor(int doctorId) => (select(doctors)..where((t) => t.id.equals(doctorId))).watch();
  Stream<Medicine> watchMedicine(int medicineId) => (select(medicines)..where((t) => t.id.equals(medicineId))).watchSingle();
  Stream<List<Medicine>> watchAllDietMedicines(int dietId) => (select(medicines)..where((t) => t.dietId.equals(dietId))).watch();
  Stream<List<Food>> watchAllDietFoods(int dietId) => (select(foods)..where((t) => t.dietId.equals(dietId))).watch();
  Stream<List<Analysis>> watchAllAnalysis(int analysisNameId) => (select(analysises)..where((t) => t.nameId.equals(analysisNameId))).watch();
  Stream<List<Date>> watchAllDoctorDates(int doctorId) => (select(dates)..where((t) => t.doctorId.equals(doctorId))).watch();
  Stream<List<MedicineReminder>> watchAllMedicineReminders(int medicineId) => (select(medicineReminders)..where((t) => t.medicineId.equals(medicineId))).watch();

  Future deleteMedicine(int id) => (delete(medicines)..where((t)=>t.id.equals(id))).go();
  Future deleteDate(int id) => (delete(dates)..where((t)=>t.id.equals(id))).go();
  Future deleteDoctor(int id) {
    (delete(dates)..where((tbl) => tbl.doctorId.equals(id))).go();
    return (delete(doctors)..where((t)=>t.id.equals(id))).go();
  }
  Future deleteDiet(int id) => (delete(diets)..where((t)=>t.id.equals(id))).go();
  Future deleteFood(int id) => (delete(foods)..where((t)=>t.id.equals(id))).go();
  Future deleteAnalysisName(int id) async{
    await (delete(analysisNames)..where((t)=>t.id.equals(id))).go();
    (delete(analysises)..where((tbl) => tbl.nameId.equals(id))).go();
  }
  Future deleteAnalysis(int id) => (delete(analysises)..where((t)=>t.id.equals(id))).go();
  Future deleteMedicineReminder(int id) => (delete(medicineReminders)..where((t)=>t.id.equals(id))).go();
  Future deleteMedicineReminders(int medicineId) => (delete(medicineReminders)..where((t)=>t.medicineId.equals(medicineId))).go();

  Future updateMedicine(Medicine entry) => update(medicines).replace(entry);
  Future updateDate(Date entry) => update(dates).replace(entry);
  Future updateDoctor(Doctor entry) => update(doctors).replace(entry);
  Future updateDiet(Diet entry) => update(diets).replace(entry);
  Future updateFood(Food entry) => update(foods).replace(entry);
  Future updateAnalysisName(AnalysisName entry) => update(analysisNames).replace(entry);
  Future updateAnalysis(Analysis entry) => update(analysises).replace(entry);

  Future<int> addMedicine(Medicine entry) => into(medicines).insert(entry);
  Future<int> addDate(Date entry) => into(dates).insert(entry);
  Future<int> addDoctor(Doctor entry) => into(doctors).insert(entry);
  Future<int> addDiet(Diet entry) => into(diets).insert(entry);
  Future<int> addFood(Food entry) => into(foods).insert(entry);
  Future<int> addAnalysisName(AnalysisName entry) => into(analysisNames).insert(entry);
  Future<int> addAnalysis(Analysis entry) => into(analysises).insert(entry);
  Future<int> addMedicineReminder(MedicineReminder reminder) => into(medicineReminders).insert(reminder);

  @override
  int get schemaVersion => 1;
}