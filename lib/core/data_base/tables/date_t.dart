import 'package:moor/moor.dart';

class Dates extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get doctorId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}