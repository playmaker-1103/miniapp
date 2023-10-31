import 'dart:async';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //font chữ google
import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

class Homescreen extends StatefulWidget {
  static const routeName = '/home-screen';

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var _taskController;

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Task t = Task.fromString(_taskController.text);

    String? tasks = prefs.getString('task');
    List list = (tasks == null) ? [] : json.decode(tasks);
    print(list);
    list.add(json.encode(t.getMap()));
    print(list);
    prefs.setString('task', json.encode(list));
    _taskController.text = '';
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskController = TextEditingController();
  }

  @override
  void dispose() {
    _taskController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task_Manager',
          style: GoogleFonts.montserrat(),
        ),
      ),
      body: Center(child: Text('No Task added yet')),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          onPressed: () => showModalBottomSheet(
              //tạo 1 sheet khi bấm nút
              context: context,
              builder: (BuildContext context) => Container(
                    padding: const EdgeInsets.all(10.0),
                    //height: 250,
                    color: Colors.blue[200],
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add task',
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(Icons.close),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 1.2,
                        ),
                        SizedBox(
                          //tạo khung điền task
                          height: 20.0,
                        ),
                        TextField(
                          //tạo chỗ để viết
                          controller: _taskController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            fillColor: Colors.white, //nền của ô điền task
                            filled: true,
                            hintText: 'Enter task',
                            hintStyle: GoogleFonts.montserrat(),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          width: MediaQuery.of(context).size.width,
                          //height: 200.0,
                          child: Row(
                            children: [
                              Container(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: ElevatedButton(
                                  //color: Colors.white,
                                  child: Text(
                                    'RESET',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                  onPressed: () => _taskController.text = ' ',
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20,
                                child: ElevatedButton(
                                  //color: Colors.blue,
                                  child: Text(
                                    'ADD',
                                    style: GoogleFonts.montserrat(),
                                  ),
                                  onPressed: () => saveData(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
