import 'package:clean_arch/core/database/api/end_points.dart';
import 'package:clean_arch/features/users/domain/entities/sub_entites/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      GeoModel(lat: json[ApiKeys.lat], lng: json[ApiKeys.lng]);

  Map<String, dynamic> toJson() => {ApiKeys.lat: lat, ApiKeys.lng: lng};
}
