import 'package:moor/moor.dart';

class FoodDiets extends Table {

  IntColumn get id => integer()();
  IntColumn get foodId => integer()();
  IntColumn get dietId => integer()();
  BoolColumn get isAllowed => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}