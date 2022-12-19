import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/core/utils/values_manger.dart';
import 'package:exams_system/data/models/question.dart';
import 'package:exams_system/data/services/database.dart';
import 'package:exams_system/presentation/components/generic/my_seperator.dart';
import 'package:exams_system/presentation/components/set_exam.dart/question_widget.dart';
import 'package:flutter/material.dart';

class SetExamScreen extends StatefulWidget {
  final String examId;
  const SetExamScreen({super.key, required this.examId});

  @override
  State<SetExamScreen> createState() => _SetExamScreenState();
}

class _SetExamScreenState extends State<SetExamScreen> {
  DataBaseServices db = DataBaseServices();
  late QuerySnapshot questionsSnapshot;

  Question getQuestionFromSnapshot(DocumentSnapshot questionSnapShot) {
    Question question = Question();
    question.question = question.question =
        (questionSnapShot.data() as dynamic)[AppStrings.question];
    List answers = [
      (questionSnapShot.data() as dynamic)[AppStrings.answer1],
      (questionSnapShot.data() as dynamic)[AppStrings.answer2],
      (questionSnapShot.data() as dynamic)[AppStrings.answer3],
      (questionSnapShot.data() as dynamic)[AppStrings.answer4],
      (questionSnapShot.data() as dynamic)[AppStrings.answer5]
    ];
    answers.shuffle();

    question.answer1 = answers[AppCount.c0];
    question.answer2 = answers[AppCount.c1];
    question.answer3 = answers[AppCount.c2];
    question.answer4 = answers[AppCount.c3];
    question.answer5 = answers[AppCount.c4];
    question.correctAnswer =
        (questionSnapShot.data() as dynamic)[AppStrings.answer1];
    question.answered = false;

    return question;
  }

  @override
  void initState() {
    db.getQuestionsData(widget.examId).then((value) {
      setState(() {
        questionsSnapshot = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.chooseCorrectly),
      ),
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - AppCount.c120,
          child: ListView.separated(
              shrinkWrap: true,
              itemCount: questionsSnapshot.docs.length,
              separatorBuilder: (context, index) => const MySeperator(),
              itemBuilder: (ctx, i) {
                return QuestionWidget(
                  total: questionsSnapshot.docs.length,
                  question: getQuestionFromSnapshot(questionsSnapshot.docs[i]),
                );
              }),
        )
      ]),
    );
  }
}
