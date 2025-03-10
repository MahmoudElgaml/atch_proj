// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 1;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      age: fields[10] as int?,
      about: fields[1] as String?,
      advertiserType: fields[2] as String?,
      email: fields[3] as String?,
      id: fields[4] as num?,
      locations: (fields[12] as Map?)?.cast<String, dynamic>(),
      name: fields[5] as String?,
      profilePic: fields[6] as String?,
      referralCode: fields[7] as dynamic,
      role: fields[8] as String?,
      username: fields[9] as String?,
      wishlist: (fields[11] as List?)?.cast<num>(),
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(12)
      ..writeByte(1)
      ..write(obj.about)
      ..writeByte(2)
      ..write(obj.advertiserType)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.profilePic)
      ..writeByte(7)
      ..write(obj.referralCode)
      ..writeByte(8)
      ..write(obj.role)
      ..writeByte(9)
      ..write(obj.username)
      ..writeByte(10)
      ..write(obj.age)
      ..writeByte(11)
      ..write(obj.wishlist)
      ..writeByte(12)
      ..write(obj.locations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
