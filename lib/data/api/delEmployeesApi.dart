import 'dart:convert';

import 'package:chamcongapp/configs/config.dart';
import 'package:http/http.dart';

Future<int> delEmployees(
    {String username}) async {
  try {
    Map<String, dynamic> body = {
      "username": username,
      "name": "name",
      "password": "password",
      "address": "address",
      "phone": 10
    };
    var finalBody = json.encode(body);
    Response response = await post(
      ConfigsApp.isDebugMode
          ? ConfigsApp.baseUrl + ConfigsApp.employeesUrl + ConfigsApp.delUrl
          : ConfigsApp.baseUrl + ConfigsApp.employeesUrl + ConfigsApp.delUrl,
      body: finalBody,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['message'] == "delete success") {
        return 1;
      } else {
        return 0;
      }
    } else {
      return 0;
    }
  } catch (e) {
    print(e.toString());
    return 0;
  }
}
