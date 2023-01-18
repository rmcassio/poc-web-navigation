import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class PersonModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final String city;

  PersonModel({
    required this.name,
    required this.number,
    required this.city,
  });
}

class PersonModelAdapter extends TypeAdapter<PersonModel> {
  @override
  final typeId = 0;

  @override
  PersonModel read(BinaryReader reader) {
    return PersonModel(
      name: reader.read(),
      city: reader.read(),
      number: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, PersonModel obj) {
    writer.write(obj.name);
    writer.write(obj.city);
    writer.write(obj.number);
  }
}
