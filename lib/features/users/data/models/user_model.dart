import 'package:clean_arch/core/database/api/end_points.dart';
import 'package:clean_arch/features/users/data/models/sub_model/address_model.dart';
import 'package:clean_arch/features/users/data/models/sub_model/company_model.dart';
import 'package:clean_arch/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String username;
  final int id;
  final String website;
  final CompanyModel companyModel;
  UserModel({
    required super.name,
    required super.email,
    required super.phone,
    required super.address,
    required this.username,
    required this.id,
    required this.website,
    required this.companyModel,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKeys.id],
      name: json[ApiKeys.name],
      email: json[ApiKeys.email],
      phone: json[ApiKeys.phone],
      website: json[ApiKeys.website],
      username: json[ApiKeys.username],
      address: AddressModel.fromJson(json[ApiKeys.address]),
      companyModel: CompanyModel.fromJson(json[ApiKeys.company]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      ApiKeys.id: id,
      ApiKeys.name: name,
      ApiKeys.email: email,
      ApiKeys.phone: phone,
      ApiKeys.website: website,
      ApiKeys.address: address,
      ApiKeys.username: username,
      ApiKeys.company: companyModel,
    };
  }
}
