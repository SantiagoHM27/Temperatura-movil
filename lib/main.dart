import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:historial_exit/screens/home_screen.dart';
import 'package:historial_exit/screens/login_screen.dart';
import 'package:historial_exit/screens/sign_up_page.dart';
import 'package:historial_exit/screens/splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAylDVV62eUIglaWdGpeY1sW-j_ytTyIFo",
        authDomain: "dht112-d7452.firebaseapp.com",
         projectId: "dht112-d7452",
        storageBucket: "dht112-d7452.appspot.com",
         messagingSenderId: "447639644886",
        appId: "1:447639644886:web:75b5762b2c8b9c3897b777"
        
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
