import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  // const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello buddy!"), backgroundColor: Colors.lightBlueAccent,),
        body: Column(
          children: [
            Expanded(child: Container(color: Colors.pinkAccent,)),
            Expanded(child: Container(color: Colors.purpleAccent,)),
            Expanded(child: Container(color: Colors.teal,)),
          ],
        )
    );
  }
}