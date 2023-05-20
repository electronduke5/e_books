import 'package:freezed_annotation/freezed_annotation.dart';



part '../../domain/models/role/role.freezed.dart';
part '../../domain/models/role/role.g.dart';

@freezed
class Role with _$Role {
  const factory Role({
    required int id,
    required String roleName,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}
