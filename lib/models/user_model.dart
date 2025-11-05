class UserModel {
  static UserModel? user;
  String id;
  String name;
  String email;
  List<String> favoriteEventsListIds;

  UserModel({required this.id, required this.name, required this.email,required this.favoriteEventsListIds});

  UserModel.fromJson(Map<String,dynamic> json):this(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    favoriteEventsListIds: (json["favoriteEventsListIds"] as List<dynamic>).map((obj)=> obj.toString()).toList() 
  );

  Map<String,dynamic>  toJson()=>{
    "id":id,
    "name":name,
    "email":email,
    "favoriteEventsListIds":favoriteEventsListIds,
  };
    
  
}
