part of 'base.dart';

@JsonSerializable()
class User extends BaseDomain {
  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "password")
  String? password;

  User(
      {this.username,
        this.password,})
      : super();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
