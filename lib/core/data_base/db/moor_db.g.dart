// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Doctor extends DataClass implements Insertable<Doctor> {
  final int id;
  final String name;
  final String phone;
  final String address;
  final String specialty;
  Doctor(
      {@required this.id,
      @required this.name,
      @required this.phone,
      @required this.address,
      @required this.specialty});
  factory Doctor.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Doctor(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      phone:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      specialty: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}specialty']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || specialty != null) {
      map['specialty'] = Variable<String>(specialty);
    }
    return map;
  }

  DoctorsCompanion toCompanion(bool nullToAbsent) {
    return DoctorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      specialty: specialty == null && nullToAbsent
          ? const Value.absent()
          : Value(specialty),
    );
  }

  factory Doctor.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Doctor(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      address: serializer.fromJson<String>(json['address']),
      specialty: serializer.fromJson<String>(json['specialty']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'address': serializer.toJson<String>(address),
      'specialty': serializer.toJson<String>(specialty),
    };
  }

  Doctor copyWith(
          {int id,
          String name,
          String phone,
          String address,
          String specialty}) =>
      Doctor(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        specialty: specialty ?? this.specialty,
      );
  @override
  String toString() {
    return (StringBuffer('Doctor(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('specialty: $specialty')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(name.hashCode,
          $mrjc(phone.hashCode, $mrjc(address.hashCode, specialty.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Doctor &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.address == this.address &&
          other.specialty == this.specialty);
}

class DoctorsCompanion extends UpdateCompanion<Doctor> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<String> address;
  final Value<String> specialty;
  const DoctorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.specialty = const Value.absent(),
  });
  DoctorsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.phone = const Value.absent(),
    this.address = const Value.absent(),
    this.specialty = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Doctor> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> phone,
    Expression<String> address,
    Expression<String> specialty,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (address != null) 'address': address,
      if (specialty != null) 'specialty': specialty,
    });
  }

  DoctorsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> phone,
      Value<String> address,
      Value<String> specialty}) {
    return DoctorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      specialty: specialty ?? this.specialty,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (specialty.present) {
      map['specialty'] = Variable<String>(specialty.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('address: $address, ')
          ..write('specialty: $specialty')
          ..write(')'))
        .toString();
  }
}

class $DoctorsTable extends Doctors with TableInfo<$DoctorsTable, Doctor> {
  final GeneratedDatabase _db;
  final String _alias;
  $DoctorsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedTextColumn _phone;
  @override
  GeneratedTextColumn get phone => _phone ??= _constructPhone();
  GeneratedTextColumn _constructPhone() {
    return GeneratedTextColumn('phone', $tableName, false,
        defaultValue: const Constant("غير محدد"));
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn('address', $tableName, false,
        defaultValue: const Constant("غير محدد"));
  }

  final VerificationMeta _specialtyMeta = const VerificationMeta('specialty');
  GeneratedTextColumn _specialty;
  @override
  GeneratedTextColumn get specialty => _specialty ??= _constructSpecialty();
  GeneratedTextColumn _constructSpecialty() {
    return GeneratedTextColumn('specialty', $tableName, false,
        defaultValue: const Constant("غير محدد"));
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, phone, address, specialty];
  @override
  $DoctorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'doctors';
  @override
  final String actualTableName = 'doctors';
  @override
  VerificationContext validateIntegrity(Insertable<Doctor> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    }
    if (data.containsKey('specialty')) {
      context.handle(_specialtyMeta,
          specialty.isAcceptableOrUnknown(data['specialty'], _specialtyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Doctor map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Doctor.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DoctorsTable createAlias(String alias) {
    return $DoctorsTable(_db, alias);
  }
}

class AnalysisName extends DataClass implements Insertable<AnalysisName> {
  final int id;
  final String name;
  final DateTime lastDate;
  AnalysisName({@required this.id, @required this.name, this.lastDate});
  factory AnalysisName.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return AnalysisName(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastDate != null) {
      map['last_date'] = Variable<DateTime>(lastDate);
    }
    return map;
  }

  AnalysisNamesCompanion toCompanion(bool nullToAbsent) {
    return AnalysisNamesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastDate: lastDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastDate),
    );
  }

  factory AnalysisName.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return AnalysisName(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      lastDate: serializer.fromJson<DateTime>(json['lastDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'lastDate': serializer.toJson<DateTime>(lastDate),
    };
  }

  AnalysisName copyWith({int id, String name, DateTime lastDate}) =>
      AnalysisName(
        id: id ?? this.id,
        name: name ?? this.name,
        lastDate: lastDate ?? this.lastDate,
      );
  @override
  String toString() {
    return (StringBuffer('AnalysisName(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastDate: $lastDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, lastDate.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is AnalysisName &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastDate == this.lastDate);
}

class AnalysisNamesCompanion extends UpdateCompanion<AnalysisName> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> lastDate;
  const AnalysisNamesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastDate = const Value.absent(),
  });
  AnalysisNamesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.lastDate = const Value.absent(),
  }) : name = Value(name);
  static Insertable<AnalysisName> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> lastDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastDate != null) 'last_date': lastDate,
    });
  }

  AnalysisNamesCompanion copyWith(
      {Value<int> id, Value<String> name, Value<DateTime> lastDate}) {
    return AnalysisNamesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastDate: lastDate ?? this.lastDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastDate.present) {
      map['last_date'] = Variable<DateTime>(lastDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalysisNamesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastDate: $lastDate')
          ..write(')'))
        .toString();
  }
}

class $AnalysisNamesTable extends AnalysisNames
    with TableInfo<$AnalysisNamesTable, AnalysisName> {
  final GeneratedDatabase _db;
  final String _alias;
  $AnalysisNamesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _lastDateMeta = const VerificationMeta('lastDate');
  GeneratedDateTimeColumn _lastDate;
  @override
  GeneratedDateTimeColumn get lastDate => _lastDate ??= _constructLastDate();
  GeneratedDateTimeColumn _constructLastDate() {
    return GeneratedDateTimeColumn(
      'last_date',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, lastDate];
  @override
  $AnalysisNamesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'analysis_names';
  @override
  final String actualTableName = 'analysis_names';
  @override
  VerificationContext validateIntegrity(Insertable<AnalysisName> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('last_date')) {
      context.handle(_lastDateMeta,
          lastDate.isAcceptableOrUnknown(data['last_date'], _lastDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnalysisName map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return AnalysisName.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AnalysisNamesTable createAlias(String alias) {
    return $AnalysisNamesTable(_db, alias);
  }
}

class Analysis extends DataClass implements Insertable<Analysis> {
  final int id;
  final String image;
  final String name;
  final String value;
  final String notes;
  final DateTime lastDate;
  final int nameId;
  Analysis(
      {@required this.id,
      this.image,
      this.name,
      @required this.value,
      this.notes,
      @required this.lastDate,
      @required this.nameId});
  factory Analysis.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Analysis(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      value:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      lastDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_date']),
      nameId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}name_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || lastDate != null) {
      map['last_date'] = Variable<DateTime>(lastDate);
    }
    if (!nullToAbsent || nameId != null) {
      map['name_id'] = Variable<int>(nameId);
    }
    return map;
  }

  AnalysisesCompanion toCompanion(bool nullToAbsent) {
    return AnalysisesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      lastDate: lastDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastDate),
      nameId:
          nameId == null && nullToAbsent ? const Value.absent() : Value(nameId),
    );
  }

  factory Analysis.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Analysis(
      id: serializer.fromJson<int>(json['id']),
      image: serializer.fromJson<String>(json['image']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
      notes: serializer.fromJson<String>(json['notes']),
      lastDate: serializer.fromJson<DateTime>(json['lastDate']),
      nameId: serializer.fromJson<int>(json['nameId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'image': serializer.toJson<String>(image),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
      'notes': serializer.toJson<String>(notes),
      'lastDate': serializer.toJson<DateTime>(lastDate),
      'nameId': serializer.toJson<int>(nameId),
    };
  }

  Analysis copyWith(
          {int id,
          String image,
          String name,
          String value,
          String notes,
          DateTime lastDate,
          int nameId}) =>
      Analysis(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        value: value ?? this.value,
        notes: notes ?? this.notes,
        lastDate: lastDate ?? this.lastDate,
        nameId: nameId ?? this.nameId,
      );
  @override
  String toString() {
    return (StringBuffer('Analysis(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('notes: $notes, ')
          ..write('lastDate: $lastDate, ')
          ..write('nameId: $nameId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          image.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  value.hashCode,
                  $mrjc(notes.hashCode,
                      $mrjc(lastDate.hashCode, nameId.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Analysis &&
          other.id == this.id &&
          other.image == this.image &&
          other.name == this.name &&
          other.value == this.value &&
          other.notes == this.notes &&
          other.lastDate == this.lastDate &&
          other.nameId == this.nameId);
}

class AnalysisesCompanion extends UpdateCompanion<Analysis> {
  final Value<int> id;
  final Value<String> image;
  final Value<String> name;
  final Value<String> value;
  final Value<String> notes;
  final Value<DateTime> lastDate;
  final Value<int> nameId;
  const AnalysisesCompanion({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
    this.notes = const Value.absent(),
    this.lastDate = const Value.absent(),
    this.nameId = const Value.absent(),
  });
  AnalysisesCompanion.insert({
    this.id = const Value.absent(),
    this.image = const Value.absent(),
    this.name = const Value.absent(),
    @required String value,
    this.notes = const Value.absent(),
    @required DateTime lastDate,
    @required int nameId,
  })  : value = Value(value),
        lastDate = Value(lastDate),
        nameId = Value(nameId);
  static Insertable<Analysis> custom({
    Expression<int> id,
    Expression<String> image,
    Expression<String> name,
    Expression<String> value,
    Expression<String> notes,
    Expression<DateTime> lastDate,
    Expression<int> nameId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
      if (notes != null) 'notes': notes,
      if (lastDate != null) 'last_date': lastDate,
      if (nameId != null) 'name_id': nameId,
    });
  }

  AnalysisesCompanion copyWith(
      {Value<int> id,
      Value<String> image,
      Value<String> name,
      Value<String> value,
      Value<String> notes,
      Value<DateTime> lastDate,
      Value<int> nameId}) {
    return AnalysisesCompanion(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      value: value ?? this.value,
      notes: notes ?? this.notes,
      lastDate: lastDate ?? this.lastDate,
      nameId: nameId ?? this.nameId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (lastDate.present) {
      map['last_date'] = Variable<DateTime>(lastDate.value);
    }
    if (nameId.present) {
      map['name_id'] = Variable<int>(nameId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnalysisesCompanion(')
          ..write('id: $id, ')
          ..write('image: $image, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('notes: $notes, ')
          ..write('lastDate: $lastDate, ')
          ..write('nameId: $nameId')
          ..write(')'))
        .toString();
  }
}

class $AnalysisesTable extends Analysises
    with TableInfo<$AnalysisesTable, Analysis> {
  final GeneratedDatabase _db;
  final String _alias;
  $AnalysisesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      true,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedTextColumn _value;
  @override
  GeneratedTextColumn get value => _value ??= _constructValue();
  GeneratedTextColumn _constructValue() {
    return GeneratedTextColumn(
      'value',
      $tableName,
      false,
    );
  }

  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  GeneratedTextColumn _notes;
  @override
  GeneratedTextColumn get notes => _notes ??= _constructNotes();
  GeneratedTextColumn _constructNotes() {
    return GeneratedTextColumn(
      'notes',
      $tableName,
      true,
    );
  }

  final VerificationMeta _lastDateMeta = const VerificationMeta('lastDate');
  GeneratedDateTimeColumn _lastDate;
  @override
  GeneratedDateTimeColumn get lastDate => _lastDate ??= _constructLastDate();
  GeneratedDateTimeColumn _constructLastDate() {
    return GeneratedDateTimeColumn(
      'last_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameIdMeta = const VerificationMeta('nameId');
  GeneratedIntColumn _nameId;
  @override
  GeneratedIntColumn get nameId => _nameId ??= _constructNameId();
  GeneratedIntColumn _constructNameId() {
    return GeneratedIntColumn(
      'name_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, image, name, value, notes, lastDate, nameId];
  @override
  $AnalysisesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'analysises';
  @override
  final String actualTableName = 'analysises';
  @override
  VerificationContext validateIntegrity(Insertable<Analysis> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes'], _notesMeta));
    }
    if (data.containsKey('last_date')) {
      context.handle(_lastDateMeta,
          lastDate.isAcceptableOrUnknown(data['last_date'], _lastDateMeta));
    } else if (isInserting) {
      context.missing(_lastDateMeta);
    }
    if (data.containsKey('name_id')) {
      context.handle(_nameIdMeta,
          nameId.isAcceptableOrUnknown(data['name_id'], _nameIdMeta));
    } else if (isInserting) {
      context.missing(_nameIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Analysis map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Analysis.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AnalysisesTable createAlias(String alias) {
    return $AnalysisesTable(_db, alias);
  }
}

class Date extends DataClass implements Insertable<Date> {
  final int id;
  final DateTime date;
  final String title;
  final int doctorId;
  Date(
      {@required this.id,
      @required this.date,
      this.title,
      @required this.doctorId});
  factory Date.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return Date(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      doctorId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}doctor_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || doctorId != null) {
      map['doctor_id'] = Variable<int>(doctorId);
    }
    return map;
  }

  DatesCompanion toCompanion(bool nullToAbsent) {
    return DatesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      doctorId: doctorId == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorId),
    );
  }

  factory Date.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Date(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      title: serializer.fromJson<String>(json['title']),
      doctorId: serializer.fromJson<int>(json['doctorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'title': serializer.toJson<String>(title),
      'doctorId': serializer.toJson<int>(doctorId),
    };
  }

  Date copyWith({int id, DateTime date, String title, int doctorId}) => Date(
        id: id ?? this.id,
        date: date ?? this.date,
        title: title ?? this.title,
        doctorId: doctorId ?? this.doctorId,
      );
  @override
  String toString() {
    return (StringBuffer('Date(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('doctorId: $doctorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(date.hashCode, $mrjc(title.hashCode, doctorId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Date &&
          other.id == this.id &&
          other.date == this.date &&
          other.title == this.title &&
          other.doctorId == this.doctorId);
}

class DatesCompanion extends UpdateCompanion<Date> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<String> title;
  final Value<int> doctorId;
  const DatesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.doctorId = const Value.absent(),
  });
  DatesCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    this.title = const Value.absent(),
    @required int doctorId,
  })  : date = Value(date),
        doctorId = Value(doctorId);
  static Insertable<Date> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<String> title,
    Expression<int> doctorId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (doctorId != null) 'doctor_id': doctorId,
    });
  }

  DatesCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date,
      Value<String> title,
      Value<int> doctorId}) {
    return DatesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      title: title ?? this.title,
      doctorId: doctorId ?? this.doctorId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (doctorId.present) {
      map['doctor_id'] = Variable<int>(doctorId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatesCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('doctorId: $doctorId')
          ..write(')'))
        .toString();
  }
}

class $DatesTable extends Dates with TableInfo<$DatesTable, Date> {
  final GeneratedDatabase _db;
  final String _alias;
  $DatesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      true,
    );
  }

  final VerificationMeta _doctorIdMeta = const VerificationMeta('doctorId');
  GeneratedIntColumn _doctorId;
  @override
  GeneratedIntColumn get doctorId => _doctorId ??= _constructDoctorId();
  GeneratedIntColumn _constructDoctorId() {
    return GeneratedIntColumn(
      'doctor_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date, title, doctorId];
  @override
  $DatesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'dates';
  @override
  final String actualTableName = 'dates';
  @override
  VerificationContext validateIntegrity(Insertable<Date> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    }
    if (data.containsKey('doctor_id')) {
      context.handle(_doctorIdMeta,
          doctorId.isAcceptableOrUnknown(data['doctor_id'], _doctorIdMeta));
    } else if (isInserting) {
      context.missing(_doctorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Date map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Date.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DatesTable createAlias(String alias) {
    return $DatesTable(_db, alias);
  }
}

class Diet extends DataClass implements Insertable<Diet> {
  final int id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  Diet(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.startDate,
      @required this.endDate});
  factory Diet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Diet(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      startDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    return map;
  }

  DietsCompanion toCompanion(bool nullToAbsent) {
    return DietsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory Diet.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Diet(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
    };
  }

  Diet copyWith(
          {int id,
          String name,
          String description,
          DateTime startDate,
          DateTime endDate}) =>
      Diet(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );
  @override
  String toString() {
    return (StringBuffer('Diet(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(description.hashCode,
              $mrjc(startDate.hashCode, endDate.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Diet &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class DietsCompanion extends UpdateCompanion<Diet> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  const DietsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
  });
  DietsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.description = const Value.absent(),
    this.startDate = const Value.absent(),
    @required DateTime endDate,
  })  : name = Value(name),
        endDate = Value(endDate);
  static Insertable<Diet> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<DateTime> startDate,
    Expression<DateTime> endDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
    });
  }

  DietsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<DateTime> startDate,
      Value<DateTime> endDate}) {
    return DietsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DietsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }
}

class $DietsTable extends Diets with TableInfo<$DietsTable, Diet> {
  final GeneratedDatabase _db;
  final String _alias;
  $DietsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        defaultValue: Constant('لايوجد وصف'));
  }

  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  GeneratedDateTimeColumn _startDate;
  @override
  GeneratedDateTimeColumn get startDate => _startDate ??= _constructStartDate();
  GeneratedDateTimeColumn _constructStartDate() {
    return GeneratedDateTimeColumn(
      'start_date',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now();
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedDateTimeColumn _endDate;
  @override
  GeneratedDateTimeColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedDateTimeColumn _constructEndDate() {
    return GeneratedDateTimeColumn(
      'end_date',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, startDate, endDate];
  @override
  $DietsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'diets';
  @override
  final String actualTableName = 'diets';
  @override
  VerificationContext validateIntegrity(Insertable<Diet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date'], _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Diet map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Diet.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DietsTable createAlias(String alias) {
    return $DietsTable(_db, alias);
  }
}

class Medicine extends DataClass implements Insertable<Medicine> {
  final int id;
  final String name;
  final String unit;
  final String notes;
  final int repeat;
  final DateTime startDate;
  final DateTime endDate;
  final bool isAfter;
  Medicine(
      {@required this.id,
      @required this.name,
      @required this.unit,
      @required this.notes,
      @required this.repeat,
      @required this.startDate,
      this.endDate,
      @required this.isAfter});
  factory Medicine.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Medicine(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      unit: stringType.mapFromDatabaseResponse(data['${effectivePrefix}unit']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
      repeat: intType.mapFromDatabaseResponse(data['${effectivePrefix}repeat']),
      startDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_date']),
      endDate: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}end_date']),
      isAfter:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}is_after']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || unit != null) {
      map['unit'] = Variable<String>(unit);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || repeat != null) {
      map['repeat'] = Variable<int>(repeat);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || isAfter != null) {
      map['is_after'] = Variable<bool>(isAfter);
    }
    return map;
  }

  MedicinesCompanion toCompanion(bool nullToAbsent) {
    return MedicinesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      unit: unit == null && nullToAbsent ? const Value.absent() : Value(unit),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      repeat:
          repeat == null && nullToAbsent ? const Value.absent() : Value(repeat),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isAfter: isAfter == null && nullToAbsent
          ? const Value.absent()
          : Value(isAfter),
    );
  }

  factory Medicine.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Medicine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      unit: serializer.fromJson<String>(json['unit']),
      notes: serializer.fromJson<String>(json['notes']),
      repeat: serializer.fromJson<int>(json['repeat']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      isAfter: serializer.fromJson<bool>(json['isAfter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'unit': serializer.toJson<String>(unit),
      'notes': serializer.toJson<String>(notes),
      'repeat': serializer.toJson<int>(repeat),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'isAfter': serializer.toJson<bool>(isAfter),
    };
  }

  Medicine copyWith(
          {int id,
          String name,
          String unit,
          String notes,
          int repeat,
          DateTime startDate,
          DateTime endDate,
          bool isAfter}) =>
      Medicine(
        id: id ?? this.id,
        name: name ?? this.name,
        unit: unit ?? this.unit,
        notes: notes ?? this.notes,
        repeat: repeat ?? this.repeat,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        isAfter: isAfter ?? this.isAfter,
      );
  @override
  String toString() {
    return (StringBuffer('Medicine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('notes: $notes, ')
          ..write('repeat: $repeat, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isAfter: $isAfter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              unit.hashCode,
              $mrjc(
                  notes.hashCode,
                  $mrjc(
                      repeat.hashCode,
                      $mrjc(startDate.hashCode,
                          $mrjc(endDate.hashCode, isAfter.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Medicine &&
          other.id == this.id &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.notes == this.notes &&
          other.repeat == this.repeat &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isAfter == this.isAfter);
}

class MedicinesCompanion extends UpdateCompanion<Medicine> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> unit;
  final Value<String> notes;
  final Value<int> repeat;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isAfter;
  const MedicinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.notes = const Value.absent(),
    this.repeat = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isAfter = const Value.absent(),
  });
  MedicinesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String unit,
    this.notes = const Value.absent(),
    @required int repeat,
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    @required bool isAfter,
  })  : name = Value(name),
        unit = Value(unit),
        repeat = Value(repeat),
        isAfter = Value(isAfter);
  static Insertable<Medicine> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> unit,
    Expression<String> notes,
    Expression<int> repeat,
    Expression<DateTime> startDate,
    Expression<DateTime> endDate,
    Expression<bool> isAfter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (unit != null) 'unit': unit,
      if (notes != null) 'notes': notes,
      if (repeat != null) 'repeat': repeat,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isAfter != null) 'is_after': isAfter,
    });
  }

  MedicinesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> unit,
      Value<String> notes,
      Value<int> repeat,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<bool> isAfter}) {
    return MedicinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      notes: notes ?? this.notes,
      repeat: repeat ?? this.repeat,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isAfter: isAfter ?? this.isAfter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<int>(repeat.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isAfter.present) {
      map['is_after'] = Variable<bool>(isAfter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicinesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('unit: $unit, ')
          ..write('notes: $notes, ')
          ..write('repeat: $repeat, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isAfter: $isAfter')
          ..write(')'))
        .toString();
  }
}

class $MedicinesTable extends Medicines
    with TableInfo<$MedicinesTable, Medicine> {
  final GeneratedDatabase _db;
  final String _alias;
  $MedicinesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _unitMeta = const VerificationMeta('unit');
  GeneratedTextColumn _unit;
  @override
  GeneratedTextColumn get unit => _unit ??= _constructUnit();
  GeneratedTextColumn _constructUnit() {
    return GeneratedTextColumn(
      'unit',
      $tableName,
      false,
    );
  }

  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  GeneratedTextColumn _notes;
  @override
  GeneratedTextColumn get notes => _notes ??= _constructNotes();
  GeneratedTextColumn _constructNotes() {
    return GeneratedTextColumn('notes', $tableName, false,
        defaultValue: Constant("غير محدد"));
  }

  final VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  GeneratedIntColumn _repeat;
  @override
  GeneratedIntColumn get repeat => _repeat ??= _constructRepeat();
  GeneratedIntColumn _constructRepeat() {
    return GeneratedIntColumn(
      'repeat',
      $tableName,
      false,
    );
  }

  final VerificationMeta _startDateMeta = const VerificationMeta('startDate');
  GeneratedDateTimeColumn _startDate;
  @override
  GeneratedDateTimeColumn get startDate => _startDate ??= _constructStartDate();
  GeneratedDateTimeColumn _constructStartDate() {
    return GeneratedDateTimeColumn(
      'start_date',
      $tableName,
      false,
    )..clientDefault = () => DateTime.now();
  }

  final VerificationMeta _endDateMeta = const VerificationMeta('endDate');
  GeneratedDateTimeColumn _endDate;
  @override
  GeneratedDateTimeColumn get endDate => _endDate ??= _constructEndDate();
  GeneratedDateTimeColumn _constructEndDate() {
    return GeneratedDateTimeColumn(
      'end_date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _isAfterMeta = const VerificationMeta('isAfter');
  GeneratedBoolColumn _isAfter;
  @override
  GeneratedBoolColumn get isAfter => _isAfter ??= _constructIsAfter();
  GeneratedBoolColumn _constructIsAfter() {
    return GeneratedBoolColumn(
      'is_after',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, unit, notes, repeat, startDate, endDate, isAfter];
  @override
  $MedicinesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'medicines';
  @override
  final String actualTableName = 'medicines';
  @override
  VerificationContext validateIntegrity(Insertable<Medicine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit'], _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes'], _notesMeta));
    }
    if (data.containsKey('repeat')) {
      context.handle(_repeatMeta,
          repeat.isAcceptableOrUnknown(data['repeat'], _repeatMeta));
    } else if (isInserting) {
      context.missing(_repeatMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date'], _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date'], _endDateMeta));
    }
    if (data.containsKey('is_after')) {
      context.handle(_isAfterMeta,
          isAfter.isAcceptableOrUnknown(data['is_after'], _isAfterMeta));
    } else if (isInserting) {
      context.missing(_isAfterMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medicine map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Medicine.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MedicinesTable createAlias(String alias) {
    return $MedicinesTable(_db, alias);
  }
}

class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  Food({@required this.id, @required this.name});
  factory Food.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Food(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Food copyWith({int id, String name}) => Food(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Food && other.id == this.id && other.name == this.name);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<Food> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  FoodsCompanion copyWith({Value<int> id, Value<String> name}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $FoodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'foods';
  @override
  final String actualTableName = 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Food.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(_db, alias);
  }
}

class MedicineReminder extends DataClass
    implements Insertable<MedicineReminder> {
  final int id;
  final int medicineId;
  final DateTime date;
  final String content;
  MedicineReminder(
      {@required this.id,
      @required this.medicineId,
      @required this.date,
      @required this.content});
  factory MedicineReminder.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final stringType = db.typeSystem.forDartType<String>();
    return MedicineReminder(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      medicineId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}medicine_id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || medicineId != null) {
      map['medicine_id'] = Variable<int>(medicineId);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  MedicineRemindersCompanion toCompanion(bool nullToAbsent) {
    return MedicineRemindersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      medicineId: medicineId == null && nullToAbsent
          ? const Value.absent()
          : Value(medicineId),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory MedicineReminder.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MedicineReminder(
      id: serializer.fromJson<int>(json['id']),
      medicineId: serializer.fromJson<int>(json['medicineId']),
      date: serializer.fromJson<DateTime>(json['date']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicineId': serializer.toJson<int>(medicineId),
      'date': serializer.toJson<DateTime>(date),
      'content': serializer.toJson<String>(content),
    };
  }

  MedicineReminder copyWith(
          {int id, int medicineId, DateTime date, String content}) =>
      MedicineReminder(
        id: id ?? this.id,
        medicineId: medicineId ?? this.medicineId,
        date: date ?? this.date,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('MedicineReminder(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('date: $date, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(medicineId.hashCode, $mrjc(date.hashCode, content.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MedicineReminder &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.date == this.date &&
          other.content == this.content);
}

class MedicineRemindersCompanion extends UpdateCompanion<MedicineReminder> {
  final Value<int> id;
  final Value<int> medicineId;
  final Value<DateTime> date;
  final Value<String> content;
  const MedicineRemindersCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.date = const Value.absent(),
    this.content = const Value.absent(),
  });
  MedicineRemindersCompanion.insert({
    this.id = const Value.absent(),
    @required int medicineId,
    @required DateTime date,
    @required String content,
  })  : medicineId = Value(medicineId),
        date = Value(date),
        content = Value(content);
  static Insertable<MedicineReminder> custom({
    Expression<int> id,
    Expression<int> medicineId,
    Expression<DateTime> date,
    Expression<String> content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (date != null) 'date': date,
      if (content != null) 'content': content,
    });
  }

  MedicineRemindersCompanion copyWith(
      {Value<int> id,
      Value<int> medicineId,
      Value<DateTime> date,
      Value<String> content}) {
    return MedicineRemindersCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      date: date ?? this.date,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<int>(medicineId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineRemindersCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('date: $date, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $MedicineRemindersTable extends MedicineReminders
    with TableInfo<$MedicineRemindersTable, MedicineReminder> {
  final GeneratedDatabase _db;
  final String _alias;
  $MedicineRemindersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _medicineIdMeta = const VerificationMeta('medicineId');
  GeneratedIntColumn _medicineId;
  @override
  GeneratedIntColumn get medicineId => _medicineId ??= _constructMedicineId();
  GeneratedIntColumn _constructMedicineId() {
    return GeneratedIntColumn(
      'medicine_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, medicineId, date, content];
  @override
  $MedicineRemindersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'medicine_reminders';
  @override
  final String actualTableName = 'medicine_reminders';
  @override
  VerificationContext validateIntegrity(Insertable<MedicineReminder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
          _medicineIdMeta,
          medicineId.isAcceptableOrUnknown(
              data['medicine_id'], _medicineIdMeta));
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content'], _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicineReminder map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MedicineReminder.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MedicineRemindersTable createAlias(String alias) {
    return $MedicineRemindersTable(_db, alias);
  }
}

class MedicineDiet extends DataClass implements Insertable<MedicineDiet> {
  final int id;
  final int medicineId;
  final int dietId;
  final bool isAllowed;
  MedicineDiet(
      {@required this.id,
      @required this.medicineId,
      @required this.dietId,
      @required this.isAllowed});
  factory MedicineDiet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return MedicineDiet(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      medicineId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}medicine_id']),
      dietId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}diet_id']),
      isAllowed: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_allowed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || medicineId != null) {
      map['medicine_id'] = Variable<int>(medicineId);
    }
    if (!nullToAbsent || dietId != null) {
      map['diet_id'] = Variable<int>(dietId);
    }
    if (!nullToAbsent || isAllowed != null) {
      map['is_allowed'] = Variable<bool>(isAllowed);
    }
    return map;
  }

  MedicineDietsCompanion toCompanion(bool nullToAbsent) {
    return MedicineDietsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      medicineId: medicineId == null && nullToAbsent
          ? const Value.absent()
          : Value(medicineId),
      dietId:
          dietId == null && nullToAbsent ? const Value.absent() : Value(dietId),
      isAllowed: isAllowed == null && nullToAbsent
          ? const Value.absent()
          : Value(isAllowed),
    );
  }

  factory MedicineDiet.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MedicineDiet(
      id: serializer.fromJson<int>(json['id']),
      medicineId: serializer.fromJson<int>(json['medicineId']),
      dietId: serializer.fromJson<int>(json['dietId']),
      isAllowed: serializer.fromJson<bool>(json['isAllowed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'medicineId': serializer.toJson<int>(medicineId),
      'dietId': serializer.toJson<int>(dietId),
      'isAllowed': serializer.toJson<bool>(isAllowed),
    };
  }

  MedicineDiet copyWith({int id, int medicineId, int dietId, bool isAllowed}) =>
      MedicineDiet(
        id: id ?? this.id,
        medicineId: medicineId ?? this.medicineId,
        dietId: dietId ?? this.dietId,
        isAllowed: isAllowed ?? this.isAllowed,
      );
  @override
  String toString() {
    return (StringBuffer('MedicineDiet(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('dietId: $dietId, ')
          ..write('isAllowed: $isAllowed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(medicineId.hashCode, $mrjc(dietId.hashCode, isAllowed.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is MedicineDiet &&
          other.id == this.id &&
          other.medicineId == this.medicineId &&
          other.dietId == this.dietId &&
          other.isAllowed == this.isAllowed);
}

class MedicineDietsCompanion extends UpdateCompanion<MedicineDiet> {
  final Value<int> id;
  final Value<int> medicineId;
  final Value<int> dietId;
  final Value<bool> isAllowed;
  const MedicineDietsCompanion({
    this.id = const Value.absent(),
    this.medicineId = const Value.absent(),
    this.dietId = const Value.absent(),
    this.isAllowed = const Value.absent(),
  });
  MedicineDietsCompanion.insert({
    this.id = const Value.absent(),
    @required int medicineId,
    @required int dietId,
    @required bool isAllowed,
  })  : medicineId = Value(medicineId),
        dietId = Value(dietId),
        isAllowed = Value(isAllowed);
  static Insertable<MedicineDiet> custom({
    Expression<int> id,
    Expression<int> medicineId,
    Expression<int> dietId,
    Expression<bool> isAllowed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (medicineId != null) 'medicine_id': medicineId,
      if (dietId != null) 'diet_id': dietId,
      if (isAllowed != null) 'is_allowed': isAllowed,
    });
  }

  MedicineDietsCompanion copyWith(
      {Value<int> id,
      Value<int> medicineId,
      Value<int> dietId,
      Value<bool> isAllowed}) {
    return MedicineDietsCompanion(
      id: id ?? this.id,
      medicineId: medicineId ?? this.medicineId,
      dietId: dietId ?? this.dietId,
      isAllowed: isAllowed ?? this.isAllowed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (medicineId.present) {
      map['medicine_id'] = Variable<int>(medicineId.value);
    }
    if (dietId.present) {
      map['diet_id'] = Variable<int>(dietId.value);
    }
    if (isAllowed.present) {
      map['is_allowed'] = Variable<bool>(isAllowed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicineDietsCompanion(')
          ..write('id: $id, ')
          ..write('medicineId: $medicineId, ')
          ..write('dietId: $dietId, ')
          ..write('isAllowed: $isAllowed')
          ..write(')'))
        .toString();
  }
}

class $MedicineDietsTable extends MedicineDiets
    with TableInfo<$MedicineDietsTable, MedicineDiet> {
  final GeneratedDatabase _db;
  final String _alias;
  $MedicineDietsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _medicineIdMeta = const VerificationMeta('medicineId');
  GeneratedIntColumn _medicineId;
  @override
  GeneratedIntColumn get medicineId => _medicineId ??= _constructMedicineId();
  GeneratedIntColumn _constructMedicineId() {
    return GeneratedIntColumn(
      'medicine_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dietIdMeta = const VerificationMeta('dietId');
  GeneratedIntColumn _dietId;
  @override
  GeneratedIntColumn get dietId => _dietId ??= _constructDietId();
  GeneratedIntColumn _constructDietId() {
    return GeneratedIntColumn(
      'diet_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isAllowedMeta = const VerificationMeta('isAllowed');
  GeneratedBoolColumn _isAllowed;
  @override
  GeneratedBoolColumn get isAllowed => _isAllowed ??= _constructIsAllowed();
  GeneratedBoolColumn _constructIsAllowed() {
    return GeneratedBoolColumn(
      'is_allowed',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, medicineId, dietId, isAllowed];
  @override
  $MedicineDietsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'medicine_diets';
  @override
  final String actualTableName = 'medicine_diets';
  @override
  VerificationContext validateIntegrity(Insertable<MedicineDiet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('medicine_id')) {
      context.handle(
          _medicineIdMeta,
          medicineId.isAcceptableOrUnknown(
              data['medicine_id'], _medicineIdMeta));
    } else if (isInserting) {
      context.missing(_medicineIdMeta);
    }
    if (data.containsKey('diet_id')) {
      context.handle(_dietIdMeta,
          dietId.isAcceptableOrUnknown(data['diet_id'], _dietIdMeta));
    } else if (isInserting) {
      context.missing(_dietIdMeta);
    }
    if (data.containsKey('is_allowed')) {
      context.handle(_isAllowedMeta,
          isAllowed.isAcceptableOrUnknown(data['is_allowed'], _isAllowedMeta));
    } else if (isInserting) {
      context.missing(_isAllowedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MedicineDiet map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MedicineDiet.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MedicineDietsTable createAlias(String alias) {
    return $MedicineDietsTable(_db, alias);
  }
}

class FoodDiet extends DataClass implements Insertable<FoodDiet> {
  final int id;
  final int foodId;
  final int dietId;
  final bool isAllowed;
  FoodDiet(
      {@required this.id,
      @required this.foodId,
      @required this.dietId,
      @required this.isAllowed});
  factory FoodDiet.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final boolType = db.typeSystem.forDartType<bool>();
    return FoodDiet(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      foodId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}food_id']),
      dietId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}diet_id']),
      isAllowed: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_allowed']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || foodId != null) {
      map['food_id'] = Variable<int>(foodId);
    }
    if (!nullToAbsent || dietId != null) {
      map['diet_id'] = Variable<int>(dietId);
    }
    if (!nullToAbsent || isAllowed != null) {
      map['is_allowed'] = Variable<bool>(isAllowed);
    }
    return map;
  }

  FoodDietsCompanion toCompanion(bool nullToAbsent) {
    return FoodDietsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      foodId:
          foodId == null && nullToAbsent ? const Value.absent() : Value(foodId),
      dietId:
          dietId == null && nullToAbsent ? const Value.absent() : Value(dietId),
      isAllowed: isAllowed == null && nullToAbsent
          ? const Value.absent()
          : Value(isAllowed),
    );
  }

  factory FoodDiet.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodDiet(
      id: serializer.fromJson<int>(json['id']),
      foodId: serializer.fromJson<int>(json['foodId']),
      dietId: serializer.fromJson<int>(json['dietId']),
      isAllowed: serializer.fromJson<bool>(json['isAllowed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'foodId': serializer.toJson<int>(foodId),
      'dietId': serializer.toJson<int>(dietId),
      'isAllowed': serializer.toJson<bool>(isAllowed),
    };
  }

  FoodDiet copyWith({int id, int foodId, int dietId, bool isAllowed}) =>
      FoodDiet(
        id: id ?? this.id,
        foodId: foodId ?? this.foodId,
        dietId: dietId ?? this.dietId,
        isAllowed: isAllowed ?? this.isAllowed,
      );
  @override
  String toString() {
    return (StringBuffer('FoodDiet(')
          ..write('id: $id, ')
          ..write('foodId: $foodId, ')
          ..write('dietId: $dietId, ')
          ..write('isAllowed: $isAllowed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(foodId.hashCode, $mrjc(dietId.hashCode, isAllowed.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FoodDiet &&
          other.id == this.id &&
          other.foodId == this.foodId &&
          other.dietId == this.dietId &&
          other.isAllowed == this.isAllowed);
}

class FoodDietsCompanion extends UpdateCompanion<FoodDiet> {
  final Value<int> id;
  final Value<int> foodId;
  final Value<int> dietId;
  final Value<bool> isAllowed;
  const FoodDietsCompanion({
    this.id = const Value.absent(),
    this.foodId = const Value.absent(),
    this.dietId = const Value.absent(),
    this.isAllowed = const Value.absent(),
  });
  FoodDietsCompanion.insert({
    this.id = const Value.absent(),
    @required int foodId,
    @required int dietId,
    @required bool isAllowed,
  })  : foodId = Value(foodId),
        dietId = Value(dietId),
        isAllowed = Value(isAllowed);
  static Insertable<FoodDiet> custom({
    Expression<int> id,
    Expression<int> foodId,
    Expression<int> dietId,
    Expression<bool> isAllowed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (foodId != null) 'food_id': foodId,
      if (dietId != null) 'diet_id': dietId,
      if (isAllowed != null) 'is_allowed': isAllowed,
    });
  }

  FoodDietsCompanion copyWith(
      {Value<int> id,
      Value<int> foodId,
      Value<int> dietId,
      Value<bool> isAllowed}) {
    return FoodDietsCompanion(
      id: id ?? this.id,
      foodId: foodId ?? this.foodId,
      dietId: dietId ?? this.dietId,
      isAllowed: isAllowed ?? this.isAllowed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (foodId.present) {
      map['food_id'] = Variable<int>(foodId.value);
    }
    if (dietId.present) {
      map['diet_id'] = Variable<int>(dietId.value);
    }
    if (isAllowed.present) {
      map['is_allowed'] = Variable<bool>(isAllowed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodDietsCompanion(')
          ..write('id: $id, ')
          ..write('foodId: $foodId, ')
          ..write('dietId: $dietId, ')
          ..write('isAllowed: $isAllowed')
          ..write(')'))
        .toString();
  }
}

class $FoodDietsTable extends FoodDiets
    with TableInfo<$FoodDietsTable, FoodDiet> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodDietsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  GeneratedIntColumn _foodId;
  @override
  GeneratedIntColumn get foodId => _foodId ??= _constructFoodId();
  GeneratedIntColumn _constructFoodId() {
    return GeneratedIntColumn(
      'food_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dietIdMeta = const VerificationMeta('dietId');
  GeneratedIntColumn _dietId;
  @override
  GeneratedIntColumn get dietId => _dietId ??= _constructDietId();
  GeneratedIntColumn _constructDietId() {
    return GeneratedIntColumn(
      'diet_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isAllowedMeta = const VerificationMeta('isAllowed');
  GeneratedBoolColumn _isAllowed;
  @override
  GeneratedBoolColumn get isAllowed => _isAllowed ??= _constructIsAllowed();
  GeneratedBoolColumn _constructIsAllowed() {
    return GeneratedBoolColumn(
      'is_allowed',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, foodId, dietId, isAllowed];
  @override
  $FoodDietsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'food_diets';
  @override
  final String actualTableName = 'food_diets';
  @override
  VerificationContext validateIntegrity(Insertable<FoodDiet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('food_id')) {
      context.handle(_foodIdMeta,
          foodId.isAcceptableOrUnknown(data['food_id'], _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (data.containsKey('diet_id')) {
      context.handle(_dietIdMeta,
          dietId.isAcceptableOrUnknown(data['diet_id'], _dietIdMeta));
    } else if (isInserting) {
      context.missing(_dietIdMeta);
    }
    if (data.containsKey('is_allowed')) {
      context.handle(_isAllowedMeta,
          isAllowed.isAcceptableOrUnknown(data['is_allowed'], _isAllowedMeta));
    } else if (isInserting) {
      context.missing(_isAllowedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodDiet map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FoodDiet.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $FoodDietsTable createAlias(String alias) {
    return $FoodDietsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DoctorsTable _doctors;
  $DoctorsTable get doctors => _doctors ??= $DoctorsTable(this);
  $AnalysisNamesTable _analysisNames;
  $AnalysisNamesTable get analysisNames =>
      _analysisNames ??= $AnalysisNamesTable(this);
  $AnalysisesTable _analysises;
  $AnalysisesTable get analysises => _analysises ??= $AnalysisesTable(this);
  $DatesTable _dates;
  $DatesTable get dates => _dates ??= $DatesTable(this);
  $DietsTable _diets;
  $DietsTable get diets => _diets ??= $DietsTable(this);
  $MedicinesTable _medicines;
  $MedicinesTable get medicines => _medicines ??= $MedicinesTable(this);
  $FoodsTable _foods;
  $FoodsTable get foods => _foods ??= $FoodsTable(this);
  $MedicineRemindersTable _medicineReminders;
  $MedicineRemindersTable get medicineReminders =>
      _medicineReminders ??= $MedicineRemindersTable(this);
  $MedicineDietsTable _medicineDiets;
  $MedicineDietsTable get medicineDiets =>
      _medicineDiets ??= $MedicineDietsTable(this);
  $FoodDietsTable _foodDiets;
  $FoodDietsTable get foodDiets => _foodDiets ??= $FoodDietsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        doctors,
        analysisNames,
        analysises,
        dates,
        diets,
        medicines,
        foods,
        medicineReminders,
        medicineDiets,
        foodDiets
      ];
}
