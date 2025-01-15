import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_labs/Static%20CRUD/constants.dart';
import 'package:flutter_labs/Static%20CRUD/user.dart';
import 'package:flutter_labs/UI%20Design,%20State%20Management,%20Navigation/lab_7/userEntryForm.dart';
import 'package:flutter/widgets.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  User _user = User();

  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Students\' Profiles',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGrid = !isGrid; // Toggle between Grid and List
              });
            },
            icon: Icon(
              isGrid ? Icons.list : Icons.grid_3x3,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return UserEntryFormPage();
                  },
                )).then((value) {
                  _user.userList.add(value);
                  setState(() {});
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _user.userList.isEmpty
              ? Expanded(
                  child: Center(
                      child: Text(
                    'No Student Found',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )),
                )
              : (isGrid
                  ? Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        itemBuilder: (context, index) {
                          print(':::GRID ITEM BUILDER CALLED:::$index');
                          return getListGridItem(index);
                        },
                        itemCount: _user.userList.length,
                        // children: getListItem(),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          print(':::LISTVIEW ITEM BUILDER CALLED:::$index');
                          return getListGridItem(index);
                        },
                        itemCount: _user.userList.length,
                      ),
                    )),
        ],
      ),
    );
  }

  List<Widget> getListItem() {
    List<Widget> widgets = [];
    for (int i = 0; i < _user.userList.length; i++) {
      print(':::GRID ITEM BUILDER CALLED:::$i');
      widgets.add(getListGridItem(i));
    }
    return widgets;
  }

  Widget getListGridItem(i) {
    return Card(
      elevation: 10,
      child: ListTile(
        onTap: () {},
        leading: Icon(Icons.account_circle_outlined),
        trailing: Wrap(
          alignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('DELETE'),
                      content: Text('Are you sure want to delete?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            _user.deleteUser(id: i);
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('No'),
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            ),
            IconButton(
                onPressed: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserEntryFormPage(data: _user.userList[i],))).then((value){
                        if(value != null){
                          _user.userList[i] = value;
                          setState(() {

                          });
                        }
                  });
                }),
                icon: Icon(Icons.edit))
          ],
        ),
        title: Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              '${_user.userList[i][NAME]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              '${_user.userList[i][CITY]} | ${_user.userList[i][EMAIL]}',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
