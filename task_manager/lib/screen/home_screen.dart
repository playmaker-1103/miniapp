import 'dart:ffi';

import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task_Manager')),
      body: Center(child: Text('No Task added yet')),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.yellow,
        onPressed: () => print('fab pressed'),
      ),
    );
  }
}
