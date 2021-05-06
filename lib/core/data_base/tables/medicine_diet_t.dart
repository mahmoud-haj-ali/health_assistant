import 'package:moor/moor.dart';

class MedicineDiets extends Table {

  IntColumn get medicineId => integer()();
  IntColumn get dietId => integer()();
  BoolColumn get isAllowed => boolean()();

  @override
  Set<Column> get primaryKey => {medicineId,dietId};
}