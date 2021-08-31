// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inform_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InfromModelAdapter extends TypeAdapter<InfromModel> {
  @override
  final int typeId = 1;

  @override
  InfromModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InfromModel(
      firstName: fields[0] as String,
      LastName: fields[1] as String,
      email: fields[2] as String,
      number: fields[3] as String,
      address: fields[5] as String,
      gender: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, InfromModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.LastName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InfromModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
