import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_k/model/todo.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String yMD, List<String> items) async {
    return await users.doc(uid).collection('TO_DO').doc(yMD).set({
      'items': items,
    });
  }

  // todo list from snapshot
  List<ToDo> _todoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((day) {
      print("IN _todoListFromSnapshot");
      print(day.id);
      print(day.data()['items'] ?? '');
      return ToDo(
        day: day.id,
        items: day.data()['items'] ?? '',
      );
    }).toList();
  }

  // get collection stream
  Stream<List<ToDo>> get todos {
    print("DOC UID ID");
    print(uid);
    return users
        .doc(uid)
        .collection('TO_DO')
        .snapshots()
        .map(_todoListFromSnapshot);
  }
}
