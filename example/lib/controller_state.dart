import 'package:example/enum.dart';

abstract class ControllerState {
  ViewState viewState;
  String message;
  ControllerState({
    this.viewState = ViewState.loading,
    this.message = 'Loading Data',
  });
}
