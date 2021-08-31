import 'package:hive/hive.dart';


part 'inform_model.g.dart';

@HiveType(typeId: 1)
class InfromModel extends HiveObject{
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String LastName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String number;
  @HiveField(4)
  final String gender;
  @HiveField(5)
  final String address;

  InfromModel({required this.firstName, required this.LastName,required this.email,required this.number,required this.address,required this.gender});
}
