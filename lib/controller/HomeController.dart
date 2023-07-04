import 'package:holocare/model/Model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeController extends ControllerMVC {
  factory HomeController([StateMVC? state]) =>
      _this ??= HomeController._(state);

  HomeController._(StateMVC? state)
      : _model = Model(),
        super(state);

  static HomeController? _this;
  final Model _model;

  int get code => _model.code;

  void update() => setState(() {});

  void incrementCounter() {
    _model.incrementCounter();
    update();
  }

  void decrementCounter() {
    _model.decrementCounter();
    update();
  }
}
