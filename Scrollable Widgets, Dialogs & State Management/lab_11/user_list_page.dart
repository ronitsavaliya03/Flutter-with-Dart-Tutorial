import 'package:flutter/material.dart';
import 'package:flutter_labs/Static%20CRUD/user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  User _user=User();
  bool isGrid=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'User Profiles',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
