import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:holocare/config/custom_exception.dart';
import 'package:holocare/data/models/user_model.dart';

class UserRepository {
  static final UserRepository _instance = UserRepository._init();

  static final firestore = FirebaseFirestore.instance;
  static final auth = FirebaseAuth.instance;
  UserRepository._init();

  factory UserRepository() {
    return _instance;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserSnapshot(id) {
    return firestore.collection("user").doc(id).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getProtecteeSnapshot(
      String protecteeUid) {
    return firestore.collection("user").doc(protecteeUid).snapshots();
  }

  Future<void> createUser(Map<String, dynamic> map) async {
    await firestore.collection("user").doc(map['id']).set(map);
  }

  Future<UserModel> getUser() async {
    // await auth.signOut();
    if (auth.currentUser == null) {
      await auth.signInAnonymously();
    }
    User firebaseUser = auth.currentUser!;
    Map<String, dynamic>? data =
        (await firestore.collection("user").doc(firebaseUser.uid).get()).data();
    data ??= {
      "uid": firebaseUser.uid,
      "code": null,
      "role": null,
      "connectTime": Timestamp.fromDate(DateTime.now()),
      "protectors": [],
      "protectee": null,
      "push": true,
      "state": true
    };
    await firestore.collection("user").doc(firebaseUser.uid).set(data);
    return UserModel.fromJson(
      data,
    );
  }

  Future<bool> existsCode(code) async {
    return (await firestore
                .collection("user")
                .where("code", isEqualTo: code)
                .get())
            .size >
        0;
  }

  Future<void> update(String id, Map<String, dynamic> map) async {
    await firestore
        .collection("user")
        .doc(id)
        .update(map)
        .catchError((error) => print(error));
  }

  Future<void> connectCode(code, protectorUid) async {
    try {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
          (await firestore
                  .collection("user")
                  .where("code", isEqualTo: code)
                  .get())
              .docs;
      if (documents.isEmpty) {
        throw CustomException("존재하지 않는 코드입니다.");
      } else {
        Map<String, dynamic> protectee = documents[0].data();
        print(protectee);
        await firestore
            .collection("user")
            .where("protectee", isEqualTo: protectee['uid'])
            .get()
            .then((qs) async {
          if (qs.size > 1) {
            throw CustomException("등록 가능한 보호자 수가 초과되었습니다.");
          } else {
            await update(
              protectorUid,
              {
                "protectee": protectee['uid'],
              },
            );
            List<dynamic> protectors = protectee['protectors'];
            protectors.add(protectorUid);
            await update(
              protectee['uid'],
              {"protectors": protectors, "code": code},
            );
          }
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  reset(String uid) async {
    // print(auth.currentUser);
    // await auth.currentUser?.delete();
    await firestore.collection("user").doc(uid).delete();
  }

  disconnect(String protecteeUid, String protectorUid) async {
    List<dynamic> protectors =
        (await firestore.collection("user").doc(protecteeUid).get())
            .data()!['protectors'];
    protectors.remove(protectorUid);
    await update(protecteeUid, {"protectors": protectors});
    await update(protectorUid, {"protectee": null, "code": null})
        .catchError((error) => {print(error)});
  }
}
