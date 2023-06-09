part of '../bloc.dart';

class GlobalBloc extends Bloc<AppEvent, GlobalState> {
  GlobalBloc() : super(GlobalState()) {
    on<ChangeEvent>(_handleOnChangeEventTrigger);
    on<GetAllNotification>(_getAllNotification);
  }

  Future<void> _handleOnChangeEventTrigger(
      ChangeEvent event, Emitter<GlobalState> emitter) async {
    try {
      var json = state.toJson();
      event.changed.forEach((key, value) {
        var temp = convertToJson(value);
        json[key] = temp;
      });
      var changedState = GlobalState.fromJson(json);
      emitter(ChangedGlobalState(
          afterState: changedState, actionName: event.eventName));
    } catch (e) {
      log.error(e);
    }
  }

  FutureOr<void> _getAllNotification(
      GetAllNotification event, Emitter<GlobalState> emit) {
    try {
      // TODO: Call Service
      var data = false;
      var json = state.toJson();
      json["isLoading"] = convertToJson(data);
      var changedState = GlobalState.fromJson(json);
      emit(ChangedGlobalState(
          afterState: changedState, actionName: "GET_ALL_NOTIFIER"));
    } catch (e) {
      log.error(e);
    }
  }
}
