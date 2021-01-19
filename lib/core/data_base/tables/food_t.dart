import 'package:moor/moor.dart';

class Foods extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isAllowed => boolean()();
  IntColumn get dietId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}