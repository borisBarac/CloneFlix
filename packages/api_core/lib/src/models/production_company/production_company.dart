
// ignore_for_file: non_constant_identifier_names, public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_company.freezed.dart';
part 'production_company.g.dart';

@freezed
class ProductionCompany with _$ProductionCompany {
 const factory ProductionCompany({
    required int id,
    required String name,
    required String? logo_path,
 }) = _ProductionCompany;

  // ignore: lines_longer_than_80_chars
  factory ProductionCompany.fromJson(Map<String, dynamic> json) => _$ProductionCompanyFromJson(json);

}
