import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapi/models/users.dart';

class UserService {
  Future<List<User>> getUsers() async {
    const url = 'https://randomuser.me/api/?results=20&seed=galaxies';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<User> list = [];
      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        list.add(User.fromJson(entry));
      }
      return list;
    } else {
      throw Exception('HTTP Failed');
    }
  }
}
