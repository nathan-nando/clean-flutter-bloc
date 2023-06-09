import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'base.g.dart';
part 'user.dart';

class BaseDomain {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "created_by")
  String? createdBy;
  @JsonKey(name: "updated_by")
  String? updatedBy;

  BaseDomain(
      {
        this.createdBy,
        this.updatedAt,
        this.updatedBy}) {
    id = const Uuid().v4();
    createdAt = DateTime.now();
  }
}