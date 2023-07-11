import 'package:cloud_firestore/cloud_firestore.dart';

abstract class StreamRepository {
  Stream<Future<QuerySnapshot<Map<String, dynamic>>>> memberstream(int code);
}
