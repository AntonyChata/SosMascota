import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
import 'app.dart'; // aquí estará tu clase MyApp con rutas y tema
=======
import 'app.dart';
>>>>>>> chata

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Firebase
  await Firebase.initializeApp();

  runApp(const MyApp());
}
