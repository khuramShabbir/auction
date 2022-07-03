// @dart=2.9

import 'package:auction/init_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
      // Replace with actual values
      options: const FirebaseOptions(
        apiKey: "AIzaSyAyE1RI5YsDLnm0gacSRObrOkEP5Mag6I8",
        appId: "1:438819053233:web:31d939b2a85e171e2bcc90",
        messagingSenderId: "438819053233",
        projectId: "auction-65d08",
      ),
    );
  }

  else{
    await Firebase.initializeApp();
  }

  runApp(const InitApp());
}
