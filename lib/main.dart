import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:lumen/shared/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'myapp.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthService()),
        ],
        child: MyApp(),
      ),
  );
}



