import 'package:moor/moor.dart';

class Medicines extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get unit => text()();
  TextColumn get notes => text().withDefault(Constant("غير محدد"))();
  IntColumn get repeat => integer()();
  DateTimeColumn get startDate => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get endDate => dateTime().nullable()();
  BoolColumn get isAfter => boolean()();


  @override
  Set<Column> get primaryKey => {id};
}