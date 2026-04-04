import 'package:clean_arch/core/database/api/end_points.dart';
import 'package:clean_arch/features/users/data/models/sub_model/geo_model.dart';
import 'package:clean_arch/features/users/domain/entities/sub_entites/address_entity.dart';

class AddressModel extends AdressEntity {
  AddressModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json[ApiKeys.street],
      suite: json[ApiKeys.suite],
      city: json[ApiKeys.city],
      zipcode: json[ApiKeys.zipcode],
      geo: GeoModel.fromJson(json[ApiKeys.geo]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.street: street,
      ApiKeys.suite: suite,
      ApiKeys.city: city,
      ApiKeys.zipcode: zipcode,
      ApiKeys.geo: geo,
    };
  }
}
