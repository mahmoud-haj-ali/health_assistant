import 'package:moor/moor.dart';

@DataClassName("Analysis")
class Analysises extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get image => text().nullable()();
  IntColumn get value => integer().nullable()();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get lastDate => dateTime()();
  IntColumn get nameId => integer()();

  @override
  Set<Column> get primaryKey => {id};


}