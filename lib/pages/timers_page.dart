import 'dart:async';
import 'package:demo/utils/colors_util.dart';
import 'package:demo/utils/habit_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TimeTracker extends StatefulWidget {
  const TimeTracker({super.key});

  @override
  State<TimeTracker> createState() => _TimeTrackerState();
}

class _TimeTrackerState extends State<TimeTracker> {
  final user = FirebaseAuth.instance.currentUser!;

  // overall habit summary
  List habitList = [
    // [habitName,habitStarted,timeSpent(sec),timeGoal (min)]
    ['Read', false, 0, 11],
    ['Code', false, 0, 1],
    ['Sleep', false, 0, 1],
    ['Writing', false, 0, 40],
  ];

  void habitStarted(int index) {
    //note what the start time is
    var startTime = DateTime.now();

    // include the time already elapsed
    int elapsedTime = habitList[index][2];

    //habbit started ot stopped
    setState(() {
      habitList[index][1] = !habitList[index][1];
    });

    if (habitList[index][1]) {
      //keep the time going!
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          //check when the user has stopped the timer
          if (!habitList[index][1]) {
            //cancel the timer
            timer.cancel();
          }

          //calculate the time elapsed by comparing current time and start time
          var currenTime = DateTime.now();
          habitList[index][2] = elapsedTime +
              currenTime.second -
              startTime.second +
              60 * (currenTime.minute - startTime.minute) +
              60 * 60 * (currenTime.hour - startTime.hour);
        });
      });
    }
  }

  void settingsOpened(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Settings for" + habitList[index][0]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hexStringToColor("#CCEAEB"),
      appBar: AppBar(
        backgroundColor: hexStringToColor("#0B666A"),
        title: Text("Consistency is the key."),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: habitList.length,
        itemBuilder: ((context, index) {
          return HabitTile(
            habitName: habitList[index][0],
            onTap: () {
              habitStarted(index);
            },
            settingsTapped: () {
              settingsOpened(index);
            },
            habitStarted: habitList[index][1],
            timeSpent: habitList[index][2],
            timeGoal: habitList[index][3],
          );
        }),
      ),
    );
  }
}
