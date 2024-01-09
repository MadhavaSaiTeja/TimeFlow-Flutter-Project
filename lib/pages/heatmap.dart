import 'package:demo/components/habit_tile_hmp.dart';
import 'package:demo/components/montly_summary.dart';
import 'package:demo/components/my_alert_box.dart';
import 'package:demo/components/my_fab.dart';
import 'package:demo/data/habit_database.dart';
// import 'package:demo/components/new_habit_box.dart';
import 'package:demo/utils/colors_util.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HeatMap extends StatefulWidget {
  const HeatMap({super.key});

  @override
  State<HeatMap> createState() => _HeatMapState();
}

class _HeatMapState extends State<HeatMap> {
  //create habit database
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");
  @override
  void initState() {
    //

    //if there is no current habit list,then it is the 1st time ever opening the app
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }
    //there already exists data, this is not the first time
    else {
      db.loadData();
    }

    //update the database
    db.updateDatabase();

    super.initState();
  }

  //checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    //update the database
    db.updateDatabase();
  }

  //save new habit
  void saveNewHabit() {
    //add new habit to todays habit list

    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    //clear habit text
    _newHabitNameController.clear();
    //clear the popup from the screen
    Navigator.of(context).pop();
    //update the database
    db.updateDatabase();
  }

  //cancel dialog
  void cancelDialogBox() {
    //clear habit text
    _newHabitNameController.clear();
    //clear the popup from the screen
    Navigator.of(context).pop();
  }

  //
  final _newHabitNameController = TextEditingController();
  //create a new habit
  void createNewHabit() {
    //show alert dialog for user to enter the new habit details
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
              controller: _newHabitNameController,
              hintText: "enter habit name",
              onSave: saveNewHabit,
              onCancel: cancelDialogBox);
        });
  }

  //open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
              controller: _newHabitNameController,
              hintText: "Edit the habit",
              onSave: saveNewHabit,
              onCancel: cancelDialogBox);
        });
  }

  //save existing habit
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    //update the database
    db.updateDatabase();
  }

  //delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    //update the database
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: hexStringToColor("#CCEAEB"),
        floatingActionButton: MyFloatingActionButton(
          onPressed: createNewHabit,
        ),
        body: ListView(
          children: [
            //montly summary heatmap
            MonthlySummary(
              datasets: db.heatMapDataSet,
              startDate: _myBox.get("START_DATE"),
            ),

            //list of habits
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: db.todaysHabitList.length,
              itemBuilder: (context, index) {
                return HabitTileHMP(
                  habitNameHMP: db.todaysHabitList[index][0],
                  habitCompletedHMP: db.todaysHabitList[index][1],
                  onChanged: (value) => checkBoxTapped(value, index),
                  settingsTapped: (context) => openHabitSettings(index),
                  deleteTapped: (context) => deleteHabit(index),
                );
              },
            ),
          ],
        ));
  }
}
