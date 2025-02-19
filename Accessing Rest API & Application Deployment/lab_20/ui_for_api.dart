import 'package:flutter/material.dart';
import 'package:new_flutter_labs/Accessing%20Rest%20API%20&%20Application%20Deployment/lab_19/user_model.dart';
import 'package:new_flutter_labs/Accessing%20Rest%20API%20&%20Application%20Deployment/lab_20/api_service.dart';
import 'package:new_flutter_labs/Accessing%20Rest%20API%20&%20Application%20Deployment/lab_20/user_details.dart';

class UiForApi extends StatefulWidget {
  const UiForApi({super.key});

  @override
  State<UiForApi> createState() => _UiForApiState();
}

class _UiForApiState extends State<UiForApi> {
  ApiService apiService= ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Details", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
        future: apiService.getAllUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No users available"));
          }

          List<UserModel> users = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserDetails(id: users[index].id!)));
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        users[index].companyName![0].toString(),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(
                      users[index].companyName.toString(),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text("Status: ${users[index].status}"),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
