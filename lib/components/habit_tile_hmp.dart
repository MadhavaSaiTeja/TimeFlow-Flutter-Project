import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTileHMP extends StatelessWidget {
  final String habitNameHMP;
  final bool habitCompletedHMP;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTileHMP({
    super.key,
    required this.habitNameHMP,
    required this.habitCompletedHMP,
    required this.onChanged,
    required this.settingsTapped,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          //settings option
          SlidableAction(
            onPressed: settingsTapped,
            backgroundColor: Colors.black,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(8),
          ),
          //delete option
          SlidableAction(
            onPressed: deleteTapped,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(8),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          //habit name
          child: Row(
            children: [
              //checkbox
              Checkbox(
                value: habitCompletedHMP,
                onChanged: onChanged,
              ),
              Text(habitNameHMP),
            ],
          ),
        ),
      ),
    );
  }
}
