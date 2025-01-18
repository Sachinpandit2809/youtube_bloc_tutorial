import 'package:freezed_annotation/freezed_annotation.dart';

part 'placeholder_user_model.freezed.dart';
part 'placeholder_user_model.g.dart';

@freezed
class PlaceholderUserModel with _$PlaceholderUserModel {
  factory PlaceholderUserModel({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) = _PlaceholderUserModel;

  factory PlaceholderUserModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceholderUserModelFromJson(json);
}

@freezed
class Address with _$Address {
  factory Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}

@freezed
class Geo with _$Geo {
  factory Geo({
    String? lat,
    String? lng,
  }) = _Geo;

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
}

@freezed
class Company with _$Company {
  factory Company({
    String? name,
    String? catchPhrase,
    String? bs,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
