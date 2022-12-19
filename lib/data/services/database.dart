import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataBaseServices {
  Future<void> addExamData(Map<String, String> examData, String examId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Exam')
          .doc(examId)
          .set(examData);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addQuestionData(Map<String, dynamic> questionData, String examId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Exam')
          .doc(examId)
          .collection('QNA')
          .add(questionData);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Stream getExamData() {
    return FirebaseFirestore.instance.collection('Exam').snapshots();
  }

  getQuestionsData(String examId) async {
    return await FirebaseFirestore.instance
        .collection('Exam')
        .doc(examId)
        .collection('QNA')
        .get();
  }
}
