import 'dart:math';

class Utils {
  static String generateCode() =>
      List.generate(10, (_) => Random().nextInt(10)).toString();
}
