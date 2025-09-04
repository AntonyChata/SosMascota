import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ViewModel
import 'viewmodels/login_viewmodel.dart';

// Vistas
import 'vistas/login/login_pantalla.dart';
import 'vistas/login/registro_pantalla.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoginViewModel())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SOS Mascotas - Autenticación',
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF00BFA5),
            brightness: Brightness.dark,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
          ),
        ),
        // Rutas iniciales (solo autenticación por ahora)
        initialRoute: '/login',
        routes: {
          '/login': (_) => const LoginPantalla(),
          '/registro': (_) => const RegistroPantalla(),
        },
      ),
    );
  }
}
