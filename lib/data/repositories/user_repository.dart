import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:holocare/config/custom_exception.dart';
import 'package:holocare/data/models/local_user.dart';

class UserRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore db;

  UserRepository(this.auth, this.db);

  Future<Map<String, dynamic>> getUser() async {
    // auth.signOut();
    // await auth.currentUser?.delete();
    User? authUser = auth.currentUser;
    print(auth.currentUser);
    if (authUser == null) {
      await auth.signInAnonymously();
      authUser = auth.currentUser!;
      await db.collection("user").doc(authUser.uid).set(
            LocalUser.newUser(authUser.uid).toJson(),
          );
    }
    return (await db.collection("user").doc(authUser.uid).get()).data()!;
  }

  Future<Map<String, dynamic>> getUserById(uid) async {
    return (await db.collection("user").doc(uid).get()).data()!;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserSnapshot(id) {
    return db.collection("user").doc(id).snapshots();
  }

  Future<bool> existsCode(code) async {
    return (await db.collection("user").where("code", isEqualTo: code).get())
            .size >
        0;
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    await db
        .collection("user")
        .doc(data['uid'])
        .update(data)
        .catchError((e) => print(e));
  }

  Future<void> deleteUser() async {
    await db
        .collection("user")
        .doc(auth.currentUser?.uid)
        .delete()
        .catchError((e) => print(e));
  }

  Future<void> connectCode(code, localUser) async {
    try {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          (await db.collection("user").where("code", isEqualTo: code).get())
              .docs;
      if (documents.isEmpty) {
        throw CustomException("존재하지 않는 코드입니다.");
      } else {
        Map<String, dynamic> protectee = documents[0].data();

        List<dynamic> protector = protectee['protectorIds'];
        if (protector.length > 1) {
          throw CustomException("등록 가능한 보호자 수가 초과되었습니다.");
        } else {
          await updateUser(
            {
              "uid": localUser.uid,
              "protecteeId": protectee['uid'],
              "connectCode": protectee['code']
            },
          );
          protector.add(localUser.uid);
          await updateUser(
            {
              "uid": protectee['uid'],
              "protectorIds": protector,
            },
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
