import 'package:moor/moor.dart';

class Dates extends Table {

  IntColumn get id => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get title => text().nullable()();
  IntColumn get doctorId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}