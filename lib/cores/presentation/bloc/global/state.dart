part of '../bloc.dart';

@JsonSerializable()
class GlobalState extends Equatable {
  final bool isLoading;
  final User? user;
  final bool isLoadingUpload;

  GlobalState({this.isLoading = false, this.user, this.isLoadingUpload = false});

  @override
  List<Object?> get props => [isLoading, user, isLoadingUpload];

  factory GlobalState.fromJson(Map<String, dynamic> json) =>
      _$GlobalStateFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalStateToJson(this);
}

class ChangedGlobalState extends GlobalState {
  final GlobalState afterState;
  final String? actionName;

  ChangedGlobalState({required this.afterState, this.actionName})
      : super(
      isLoading: afterState.isLoading,
      user: afterState.user,
      isLoadingUpload: afterState.isLoadingUpload);

  @override
  List<Object?> get props => [
    ...super.props,
    actionName,
  ];
}
