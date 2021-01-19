import 'package:moor/moor.dart';

class Diets extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get startDate => dateTime().clientDefault(()=>DateTime.now())();
  DateTimeColumn get endDate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}