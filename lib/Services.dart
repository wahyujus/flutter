import 'package:http/http.dart' as http;
import 'User.dart';

class Services{
  static const String url = "https://naufalnibros.github.io/data.json"

  static Future<List<User>> getUser() async{
    try {
      final response = await http.get(url);
      if(200 == response.statusCode){
        final List<User> users = userFromJson(response.body);
        return users;
      } else {
        return List<User>();
      }
    }catch(e){
      return List<User>();

    }
  }
}