import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telegram_clone_ui/model/usersModel.dart';

class UserServices {
  final String url = "https://reqres.in/api/users?page=2";
  Future<UsersModel?> fetchUsers() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonBody = UsersModel.fromJson(jsonDecode(response.body));
      return jsonBody;
    } else {
      print("Network Error =>${response.statusCode}");
    }
  }
}
