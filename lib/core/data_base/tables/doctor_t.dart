import 'package:moor/moor.dart';

class Doctors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get phone => text().withDefault(const Constant("غير محدد"))();
  TextColumn get address => text().withDefault(const Constant("غير محدد"))();
  TextColumn get specialty => text().withDefault(const Constant("غير محدد"))();

  @override
  Set<Column> get primaryKey => {id};
}