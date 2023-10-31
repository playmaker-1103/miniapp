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
          backgroundColor: Colors.blue,
          onPressed: () => showModalBottomSheet(
              //tạo 1 sheet khi bấm nút
              context: context,
              builder: (BuildContext context) => Container(
                    height: 500,
                    color: Colors.blue[200],
                    child: Column(
                      children: [Text('Add task')],
                    ),
                  ))),
    );
  }
}
