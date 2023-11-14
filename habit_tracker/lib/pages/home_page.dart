import 'package:flutter/material.dart';
import 'package:habit_tracker/components/habit_tile.dart';
import 'package:habit_tracker/components/my_fab.dart';
import 'package:habit_tracker/components/new_habit_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //data structure for todays list
  List todaysHabitList = [
    // [ habitName, habitCompleted]
    ["Morning Run", false],
    ["Read book", false],
    ["I dont know what to do ", false],
  ];

  //checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  //create new habit
  void createNewHabit() {
    //show alert dialog for user to enter the new habits detals
    showDialog(
      context: context,
      builder: (context) {
        return EnterNewHabitBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index) {
          return HabitTile(
              habitName: todaysHabitList[index][0],
              habitCompleted: todaysHabitList[index][1],
              onChanged: (value) => checkBoxTapped(value, index));
        },
      ),
    );
  }
}
