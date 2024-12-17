import './constants.dart';
class User{
  List<Map<String,dynamic>> userList=[];

  void addUserInList({required name, required age, required email}){
    Map<String, dynamic> map={};

    map[NAME]=name;
    map[AGE]=age;
    map[EMAIL]=email;

    userList.add(map);
  }

  List<Map<String,dynamic>> display(){
    return userList;
  }

  void updateUser({ name,  age,  email, required id}){
    Map<String, dynamic> map={};

    map[NAME]=name;
    map[AGE]=age;
    map[EMAIL]=email;

    userList[id]=map;
  }

  void deleteUser({required id}){
    userList.removeAt(id);
  }
}