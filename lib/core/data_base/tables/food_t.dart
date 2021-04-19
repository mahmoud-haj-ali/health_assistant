import 'package:moor/moor.dart';

class Foods extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}