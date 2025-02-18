class UserModel{
  int? id;
  String? name;

  UserModel({required this.id, required this.name});

  static UserModel toUser(Map<String, dynamic> u){
    return UserModel(id: u['id'], name: u['name']);
  }

  Map<String, dynamic> toMap(){
    return {'id': this.id, 'name': this.name};
  }

}