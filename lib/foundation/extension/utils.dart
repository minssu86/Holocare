import 'dart:math';

class Utils {
  static int generateCode() =>
      int.parse(List.generate(7, (_) => Random().nextInt(9)).join(""));
}
