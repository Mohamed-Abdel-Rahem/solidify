import 'package:clean_arch/core/database/api/end_points.dart';

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json[ApiKeys.name],
      catchPhrase: json[ApiKeys.catchPhrase],
      bs: json[ApiKeys.bs],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.name: name,
      ApiKeys.catchPhrase: catchPhrase,
      ApiKeys.bs: bs,
    };
  }
}
