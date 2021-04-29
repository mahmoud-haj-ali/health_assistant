import 'package:moor/moor.dart';

class Diets extends Table {

  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(Constant('لايوجد وصف'))();
  DateTimeColumn get startDate => dateTime().clientDefault(()=>DateTime.now())();
  DateTimeColumn get endDate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}