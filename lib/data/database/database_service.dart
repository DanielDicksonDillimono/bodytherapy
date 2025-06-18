import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore;

  DatabaseService(this._firestore);

  var usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).set(data);
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<void> createReport(String userId, Map<String, dynamic> data) async {
    try {
      await usersCollection.doc(userId).collection('reports').add(data);
    } catch (e) {
      throw Exception('Failed to create report: $e');
    }
  }

  Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(userId).update(data);
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getReports(String userId) async {
    try {
      QuerySnapshot snapshot =
          await usersCollection.doc(userId).collection('reports').get();
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

  Future updateReport(
      String userId, String reportId, Map<String, dynamic> data) async {
    try {
      await usersCollection
          .doc(userId)
          .collection('reports')
          .doc(reportId)
          .update(data);
    } catch (e) {
      throw Exception('Failed to update report: $e');
    }
  }

  Future<void> deleteReport(String userId, String reportId) async {
    try {
      await usersCollection
          .doc(userId)
          .collection('reports')
          .doc(reportId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete report: $e');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
