import 'dart:convert';

import 'package:lumen/shared/values/routes.dart';
import 'package:http/http.dart' as http;

class CadastroService{
  cadastrar(String email, String password) async{
    http.Response response = await http.post(
      Uri.parse(Routes().cadastro()),
      body: json.encode(
        {"email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );

    print(response.body);
  }
}

