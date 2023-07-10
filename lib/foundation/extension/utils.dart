import 'dart:math';

class Utils {
  static int generateCode() =>
      int.parse(List.generate(10, (_) => Random().nextInt(10)).join(""));
}
