import 'package:flutter/material.dart';

class Validation extends StatefulWidget {
  Validation({super.key});

  @override
  State<Validation> createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey();

  bool isHide=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlueAccent,
      //   title: Text(
      //     'Registration',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body:
      Center(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 300,
              margin: EdgeInsets.all(20.0),
              decoration:  BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _key,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Registration", style: TextStyle(color: Colors.white, fontSize: 40),),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if(value!.isEmpty){
                              return "Enter valid username";
                            }

                            return null;
                          },
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Enter username',
                            labelStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.red,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: TextFormField(
                          validator: (value) {
                              if(value!.isEmpty){
                                return "Enter valid password";
                              }

                              return null;
                          },
                          obscureText: isHide,
                          controller: passController,
                          decoration: InputDecoration(
                            labelText: 'Enter password',
                            labelStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(icon: Icon(isHide? Icons.visibility: Icons.visibility_off),onPressed: (){
                              setState(() {
                                isHide= !isHide;
                              });
                            },),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print('IS VALIDATE : ${_key.currentState!.validate()}');
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}