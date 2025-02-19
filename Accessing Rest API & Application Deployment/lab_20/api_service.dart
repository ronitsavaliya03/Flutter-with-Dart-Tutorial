import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_flutter_labs/Accessing%20Rest%20API%20&%20Application%20Deployment/lab_19/user_model.dart';

class ApiService{
  String baseUrl = "https://66f4062c77b5e8897097ef61.mockapi.io/bill";

  Future<List<UserModel>> getAllUser() async {
        var res = await http.get(Uri.parse(baseUrl));
        List<dynamic> data = jsonDecode(res.body);
        List<UserModel> users = [];

        data.forEach((element){
          users.add(UserModel.toUser(element));
        });

        return users;
  }

  Future<UserModel> getUserById(String id) async {
    var res = await http.get(Uri.parse("$baseUrl/$id"));
    dynamic data = jsonDecode(res.body);
    UserModel user = UserModel.toUser(data);
    return user;
  }
}