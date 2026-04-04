import 'package:clean_arch/features/users/domain/entities/sub_entites/address_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final String phone;
  final AdressEntity address;

  UserEntity({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}

