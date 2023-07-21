import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firemessageProvider = Provider((_) => FirebaseMessaging.instance);

class FireMessageHelper {
  final dynamic _reader;

  FireMessageHelper(this._reader);

  late final FirebaseMessaging _firemessage = _reader(firemessageProvider);

  Future<String?> getToken() async {
    return await _firemessage.getToken();
  }
}
