import 'package:http/http.dart' as http;
import 'package:real_time_chat_app/config/environments.dart';

import 'package:real_time_chat_app/models/user_model.dart';
import 'package:real_time_chat_app/models/users_response.dart';
import 'package:real_time_chat_app/providers/auth_service.dart';

class UserServices {

  Future<List<UserModel>> getUsers() async {
    try {
      final respUsers = await http.get(
        Uri.https(Environments.apiUrl, '/api/users'),
        headers: {'Content-Type': 'application/json', 'x-token': await AuthService.getToken()},
      );
      if (respUsers.statusCode == 200) {
        final usersResponse = usersResponseFromJson(respUsers.body);
        return usersResponse.users;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
