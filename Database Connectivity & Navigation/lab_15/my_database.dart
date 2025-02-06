import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, 'cureOption.db');
    var db = await openDatabase(path, onCreate: (db, version) async {
      await db.execute('''
          create table Task(
           task_id INTEGER PRIMARY KEY AUTOINCREMENT,
           task_work TEXT NOT NULL
          )''');
      await db.execute('''
          create table Category(
           category_id INTEGER PRIMARY KEY AUTOINCREMENT,
           category_name TEXT NOT NULL,
           task_id INTEGER NOT NULL,
           FOREIGN KEY (task_id) REFERENCES Task(task_id)
          )
        ''');
    }, onUpgrade: (db, oldVersion, newVersion) {}, version: 1);
    return db;
  }

  Future<List<Map<String, dynamic>>> selectAllTask() async {
    Database db = await initDatabase();
    // List<Map<String,dynamic>> states = await db.query("State");
    return await db.rawQuery("select * from Task");
  }

  Future<void> insertTasks() async{
    Database db= await initDatabase();

    int id=await db.insert("Task", {
      "task_work":"to do list"
    });
  }
  Future<List<Map<String, dynamic>>> selectAllTaskUsingJoin() async {
    Database db = await initDatabase();
    // List<Map<String,dynamic>> states = await db.query("State");
    return await db.rawQuery("""
    SELECT 
    Task.task_id, 
    Task.task_work, 
    Category.category_id, 
    Category.category_name
    FROM Task
    INNER JOIN Category ON Task.task_id = Category.task_id;  
    """);
  }
}
