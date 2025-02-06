import 'package:flutter/material.dart';
import 'package:flutter_labs/Database%20Connectivity%20&%20Navigation/lab_15/my_database.dart';

class ForDatabase extends StatefulWidget {
  const ForDatabase({super.key});

  @override
  State<ForDatabase> createState() => _ForDatabaseState();
}

class _ForDatabaseState extends State<ForDatabase> {
  MyDatabase database=MyDatabase();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectAll();
  }

  Future<void> selectAll() async{
    await database.insertTasks();
    List<Map<String, dynamic>> tasks=await database.selectAllTask();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
