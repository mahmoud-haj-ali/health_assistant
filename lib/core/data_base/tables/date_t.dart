import 'package:moor/moor.dart';

class Dates extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get title => text().nullable()();
  IntColumn get doctorId => integer()();
  IntColumn get notificationId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}