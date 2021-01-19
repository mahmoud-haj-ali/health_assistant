import 'package:moor/moor.dart';

class Doctors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text()();
  TextColumn get address => text()();

  @override
  Set<Column> get primaryKey => {id};
}