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
  final String name;
  final String image;
  final int value;
  final String notes;
  final DateTime lastDate;
  final int nameId;
  Analysis(
      {@required this.id,
      @required this.name,
      this.image,
      this.value,
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
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      value: intType.mapFromDatabaseResponse(data['${effectivePrefix}value']),
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
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<int>(value);
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
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
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
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      value: serializer.fromJson<int>(json['value']),
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
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'value': serializer.toJson<int>(value),
      'notes': serializer.toJson<String>(notes),
      'lastDate': serializer.toJson<DateTime>(lastDate),
      'nameId': serializer.toJson<int>(nameId),
    };
  }

  Analysis copyWith(
          {int id,
          String name,
          String image,
          int value,
          String notes,
          DateTime lastDate,
          int nameId}) =>
      Analysis(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        value: value ?? this.value,
        notes: notes ?? this.notes,
        lastDate: lastDate ?? this.lastDate,
        nameId: nameId ?? this.nameId,
      );
  @override
  String toString() {
    return (StringBuffer('Analysis(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
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
          name.hashCode,
          $mrjc(
              image.hashCode,
              $mrjc(
                  value.hashCode,
                  $mrjc(notes.hashCode,
                      $mrjc(lastDate.hashCode, nameId.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Analysis &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.value == this.value &&
          other.notes == this.notes &&
          other.lastDate == this.lastDate &&
          other.nameId == this.nameId);
}

class AnalysisesCompanion extends UpdateCompanion<Analysis> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<int> value;
  final Value<String> notes;
  final Value<DateTime> lastDate;
  final Value<int> nameId;
  const AnalysisesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.value = const Value.absent(),
    this.notes = const Value.absent(),
    this.lastDate = const Value.absent(),
    this.nameId = const Value.absent(),
  });
  AnalysisesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.image = const Value.absent(),
    this.value = const Value.absent(),
    this.notes = const Value.absent(),
    @required DateTime lastDate,
    @required int nameId,
  })  : name = Value(name),
        lastDate = Value(lastDate),
        nameId = Value(nameId);
  static Insertable<Analysis> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> image,
    Expression<int> value,
    Expression<String> notes,
    Expression<DateTime> lastDate,
    Expression<int> nameId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (value != null) 'value': value,
      if (notes != null) 'notes': notes,
      if (lastDate != null) 'last_date': lastDate,
      if (nameId != null) 'name_id': nameId,
    });
  }

  AnalysisesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> image,
      Value<int> value,
      Value<String> notes,
      Value<DateTime> lastDate,
      Value<int> nameId}) {
    return AnalysisesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
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
          ..write('name: $name, ')
          ..write('image: $image, ')
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

  final VerificationMeta _valueMeta = const VerificationMeta('value');
  GeneratedIntColumn _value;
  @override
  GeneratedIntColumn get value => _value ??= _constructValue();
  GeneratedIntColumn _constructValue() {
    return GeneratedIntColumn(
      'value',
      $tableName,
      true,
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
      [id, name, image, value, notes, lastDate, nameId];
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
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image'], _imageMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value'], _valueMeta));
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
  final int doctorId;
  Date({@required this.id, @required this.date, @required this.doctorId});
  factory Date.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Date(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
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
    if (!nullToAbsent || doctorId != null) {
      map['doctor_id'] = Variable<int>(doctorId);
    }
    return map;
  }

  DatesCompanion toCompanion(bool nullToAbsent) {
    return DatesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
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
      doctorId: serializer.fromJson<int>(json['doctorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'doctorId': serializer.toJson<int>(doctorId),
    };
  }

  Date copyWith({int id, DateTime date, int doctorId}) => Date(
        id: id ?? this.id,
        date: date ?? this.date,
        doctorId: doctorId ?? this.doctorId,
      );
  @override
  String toString() {
    return (StringBuffer('Date(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('doctorId: $doctorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(date.hashCode, doctorId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Date &&
          other.id == this.id &&
          other.date == this.date &&
          other.doctorId == this.doctorId);
}

class DatesCompanion extends UpdateCompanion<Date> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> doctorId;
  const DatesCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.doctorId = const Value.absent(),
  });
  DatesCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date,
    @required int doctorId,
  })  : date = Value(date),
        doctorId = Value(doctorId);
  static Insertable<Date> custom({
    Expression<int> id,
    Expression<DateTime> date,
    Expression<int> doctorId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (doctorId != null) 'doctor_id': doctorId,
    });
  }

  DatesCompanion copyWith(
      {Value<int> id, Value<DateTime> date, Value<int> doctorId}) {
    return DatesCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
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
  List<GeneratedColumn> get $columns => [id, date, doctorId];
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
      this.description,
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
    return GeneratedTextColumn(
      'description',
      $tableName,
      true,
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

class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  final bool isAllowed;
  final int dietId;
  Food(
      {@required this.id,
      @required this.name,
      @required this.isAllowed,
      @required this.dietId});
  factory Food.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Food(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      isAllowed: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_allowed']),
      dietId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}diet_id']),
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
    if (!nullToAbsent || isAllowed != null) {
      map['is_allowed'] = Variable<bool>(isAllowed);
    }
    if (!nullToAbsent || dietId != null) {
      map['diet_id'] = Variable<int>(dietId);
    }
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isAllowed: isAllowed == null && nullToAbsent
          ? const Value.absent()
          : Value(isAllowed),
      dietId:
          dietId == null && nullToAbsent ? const Value.absent() : Value(dietId),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isAllowed: serializer.fromJson<bool>(json['isAllowed']),
      dietId: serializer.fromJson<int>(json['dietId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isAllowed': serializer.toJson<bool>(isAllowed),
      'dietId': serializer.toJson<int>(dietId),
    };
  }

  Food copyWith({int id, String name, bool isAllowed, int dietId}) => Food(
        id: id ?? this.id,
        name: name ?? this.name,
        isAllowed: isAllowed ?? this.isAllowed,
        dietId: dietId ?? this.dietId,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isAllowed: $isAllowed, ')
          ..write('dietId: $dietId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(isAllowed.hashCode, dietId.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.isAllowed == this.isAllowed &&
          other.dietId == this.dietId);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isAllowed;
  final Value<int> dietId;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isAllowed = const Value.absent(),
    this.dietId = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required bool isAllowed,
    @required int dietId,
  })  : name = Value(name),
        isAllowed = Value(isAllowed),
        dietId = Value(dietId);
  static Insertable<Food> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<bool> isAllowed,
    Expression<int> dietId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isAllowed != null) 'is_allowed': isAllowed,
      if (dietId != null) 'diet_id': dietId,
    });
  }

  FoodsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<bool> isAllowed,
      Value<int> dietId}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isAllowed: isAllowed ?? this.isAllowed,
      dietId: dietId ?? this.dietId,
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
    if (isAllowed.present) {
      map['is_allowed'] = Variable<bool>(isAllowed.value);
    }
    if (dietId.present) {
      map['diet_id'] = Variable<int>(dietId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isAllowed: $isAllowed, ')
          ..write('dietId: $dietId')
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

  @override
  List<GeneratedColumn> get $columns => [id, name, isAllowed, dietId];
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
    if (data.containsKey('is_allowed')) {
      context.handle(_isAllowedMeta,
          isAllowed.isAcceptableOrUnknown(data['is_allowed'], _isAllowedMeta));
    } else if (isInserting) {
      context.missing(_isAllowedMeta);
    }
    if (data.containsKey('diet_id')) {
      context.handle(_dietIdMeta,
          dietId.isAcceptableOrUnknown(data['diet_id'], _dietIdMeta));
    } else if (isInserting) {
      context.missing(_dietIdMeta);
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

class Medicine extends DataClass implements Insertable<Medicine> {
  final int id;
  final String name;
  final String unit;
  final String notes;
  final int repeat;
  final int dietId;
  final DateTime startDate;
  final DateTime endDate;
  final bool isAfter;
  Medicine(
      {@required this.id,
      @required this.name,
      @required this.unit,
      this.notes,
      @required this.repeat,
      this.dietId,
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
      dietId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}diet_id']),
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
    if (!nullToAbsent || dietId != null) {
      map['diet_id'] = Variable<int>(dietId);
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
      dietId:
          dietId == null && nullToAbsent ? const Value.absent() : Value(dietId),
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
      dietId: serializer.fromJson<int>(json['dietId']),
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
      'dietId': serializer.toJson<int>(dietId),
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
          int dietId,
          DateTime startDate,
          DateTime endDate,
          bool isAfter}) =>
      Medicine(
        id: id ?? this.id,
        name: name ?? this.name,
        unit: unit ?? this.unit,
        notes: notes ?? this.notes,
        repeat: repeat ?? this.repeat,
        dietId: dietId ?? this.dietId,
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
          ..write('dietId: $dietId, ')
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
                      $mrjc(
                          dietId.hashCode,
                          $mrjc(startDate.hashCode,
                              $mrjc(endDate.hashCode, isAfter.hashCode)))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Medicine &&
          other.id == this.id &&
          other.name == this.name &&
          other.unit == this.unit &&
          other.notes == this.notes &&
          other.repeat == this.repeat &&
          other.dietId == this.dietId &&
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
  final Value<int> dietId;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<bool> isAfter;
  const MedicinesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.unit = const Value.absent(),
    this.notes = const Value.absent(),
    this.repeat = const Value.absent(),
    this.dietId = const Value.absent(),
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
    this.dietId = const Value.absent(),
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
    Expression<int> dietId,
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
      if (dietId != null) 'diet_id': dietId,
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
      Value<int> dietId,
      Value<DateTime> startDate,
      Value<DateTime> endDate,
      Value<bool> isAfter}) {
    return MedicinesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      unit: unit ?? this.unit,
      notes: notes ?? this.notes,
      repeat: repeat ?? this.repeat,
      dietId: dietId ?? this.dietId,
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
    if (dietId.present) {
      map['diet_id'] = Variable<int>(dietId.value);
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
          ..write('dietId: $dietId, ')
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
    return GeneratedTextColumn(
      'notes',
      $tableName,
      true,
    );
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

  final VerificationMeta _dietIdMeta = const VerificationMeta('dietId');
  GeneratedIntColumn _dietId;
  @override
  GeneratedIntColumn get dietId => _dietId ??= _constructDietId();
  GeneratedIntColumn _constructDietId() {
    return GeneratedIntColumn(
      'diet_id',
      $tableName,
      true,
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
      [id, name, unit, notes, repeat, dietId, startDate, endDate, isAfter];
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
    if (data.containsKey('diet_id')) {
      context.handle(_dietIdMeta,
          dietId.isAcceptableOrUnknown(data['diet_id'], _dietIdMeta));
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
  $FoodsTable _foods;
  $FoodsTable get foods => _foods ??= $FoodsTable(this);
  $MedicinesTable _medicines;
  $MedicinesTable get medicines => _medicines ??= $MedicinesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [doctors, analysisNames, analysises, dates, diets, foods, medicines];
}
