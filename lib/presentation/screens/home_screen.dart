import 'package:exams_system/core/prefs/app_prefs.dart';
import 'package:exams_system/core/routes/route_names.dart';
import 'package:exams_system/core/utils/app_assets.dart';
import 'package:exams_system/core/utils/app_colors.dart';
import 'package:exams_system/core/utils/app_strings.dart';
import 'package:exams_system/data/services/database.dart';
import 'package:exams_system/presentation/components/generic/diamond_button.dart';
import 'package:exams_system/presentation/components/home/exam_card.dart';
import 'package:exams_system/presentation/screens/create_exam_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream examData;
  DataBaseServices db = DataBaseServices();

  Widget examsList() {
    return StreamBuilder(
        stream: examData,
        builder: (ctx, snapshot) => snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (ctx, i) {
                  return ExamCard(
                    title: snapshot.data.docs[i][AppStrings.examTitle],
                    description: snapshot.data.docs[i][AppStrings.examDiscreption],
                    examId: snapshot.data.docs[i][AppStrings.examId],
                  );
                }));
  }

  @override
  void initState() {
    examData = db.getExamData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
              ),
              onPressed: () {
                setState(() {
                  AppPrefs.saveLogout();
                  Navigator.of(context).pushNamed(Routes.signInRoute);
                });
              })
        ],
      ),
      body: examsList(),
      floatingActionButton: DiamondButton(
          svgIcon: AppImages.plusIc,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateExam(),
              ),
            );
          },
          backgroundColor: AppColors.myYellow,
          iconColor: AppColors.white),
    );
  }
}
