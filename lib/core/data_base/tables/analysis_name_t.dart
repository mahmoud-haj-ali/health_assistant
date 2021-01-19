import 'package:moor/moor.dart';

class AnalysisNames extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get lastDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}