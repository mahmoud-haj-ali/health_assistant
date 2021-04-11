import 'package:moor/moor.dart';

class MedicineDiets extends Table {

  IntColumn get id => integer().autoIncrement()();
  IntColumn get medicineId => integer()();
  IntColumn get dietId => integer()();
  BoolColumn get isAllowed => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}