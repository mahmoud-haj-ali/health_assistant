import 'package:moor/moor.dart';

class Medicines extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get unit => text()();
  IntColumn get repeat => integer()();
  IntColumn get dietId => integer()();
  DateTimeColumn get startDate => dateTime().clientDefault(()=>DateTime.now())();
  DateTimeColumn get endDate => dateTime()();
  BoolColumn get isAfter => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}