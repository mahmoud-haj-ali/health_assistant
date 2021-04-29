import 'package:moor/moor.dart';

@DataClassName("MedicineReminder")
class MedicineReminders extends Table {

  IntColumn get id => integer()();
  IntColumn get medicineId => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get content => text()();

  @override
  Set<Column> get primaryKey => {id};
}