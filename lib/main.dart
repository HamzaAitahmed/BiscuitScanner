import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:biscuit_scanner/home.dart';
import 'package:biscuit_scanner/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<FirebaseApp> _initializeFirebase() async {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biscuit Scanner',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          // Si Firebase n'est pas encore prêt, affiche un écran de chargement
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          // uEoaMZyLavfJyI3EBuJUoJD9dVP2

          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text("Erreur: ${snapshot.error}")),
            );
          }

          final FirebaseAuth auth = FirebaseAuth.instance;
          return auth.currentUser == null ? const LoginPage() : const Home();
        },
      ),
    );
  }
}
