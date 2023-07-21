import 'package:cloud_firestore/cloud_firestore.dart';

abstract class StreamRepository {
  Stream<QuerySnapshot<Map<String, dynamic>>> memberstream(int code);
}
