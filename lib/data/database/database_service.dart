import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  //TODO: Make User nullable i.e User? _user;, then for each function,
  //there should be a String userId = ' '. If the userId parameter is passed and it is not empty,
  //use that userId, otherwise use _user.uid. This way we can use the same DatabaseService for both
  //authenticated and unauthenticated users or for a different user.
  //This is useful for "admin" functionalities where we need to access other users' data.

  final FirebaseFirestore _firestore;
  final User? _user;

  DatabaseService(this._firestore, this._user);

  var usersCollection = FirebaseFirestore.instance.collection('users');
  var reportsStream = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('reports')
      .snapshots();

  Future<void> createUser(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).set(data);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<void> createReport(Map<String, dynamic> data) async {
    try {
      await usersCollection.doc(_user!.uid).collection('reports').add(data);
    } catch (e) {
      throw Exception('Failed to create report: $e');
    }
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(_user!.uid).update(data);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getReports() async {
    try {
      QuerySnapshot snapshot =
          await usersCollection.doc(_user!.uid).collection('reports').get();
      return snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      throw Exception('Failed to get reports: $e');
    }
  }

  Future<Map<String, dynamic>?> getUser(String userId) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(userId).get();
      return doc.data() as Map<String, dynamic>?;
    } catch (e) {
      throw Exception('Failed to get user: $e');
    }
  }

  Future updateReport(String reportId, Map<String, dynamic> data) async {
    try {
      await usersCollection
          .doc(_user!.uid)
          .collection('reports')
          .doc(reportId)
          .update(data);
    } catch (e) {
      throw Exception('Failed to update report: $e');
    }
  }

  Future<void> deleteReport(String reportId) async {
    try {
      await usersCollection
          .doc(_user!.uid)
          .collection('reports')
          .doc(reportId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete report: $e');
    }
  }

  Future<void> deleteUser() async {
    try {
      await _firestore.collection('users').doc(_user!.uid).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
