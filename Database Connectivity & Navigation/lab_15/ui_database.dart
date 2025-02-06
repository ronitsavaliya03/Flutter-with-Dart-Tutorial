import 'package:flutter/material.dart';
import 'package:flutter_labs/Database%20Connectivity%20&%20Navigation/lab_15/my_database.dart';

class UiDatabase extends StatefulWidget {
  const UiDatabase({super.key});

  @override
  State<UiDatabase> createState() => _UiDatabaseState();
}

MyDatabase database = MyDatabase();

void selectState() async {
  List<Map<String, dynamic>> list = await database.selectAllTask();
  print(list);
}

class _UiDatabaseState extends State<UiDatabase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ToDo"),
        ),
        body: FutureBuilder(
          future: database.selectAllTaskUsingJoin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(
                      child: Text(snapshot.data![index]['task_work']),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text("No data available"),
              );
            }
          },
        ),
      ),
    );
  }
}
