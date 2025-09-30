import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'vista/auth/pantalla_registro.dart';
import 'vista/auth/pantalla_login.dart';
import 'vista/auth/pantalla_recuperar.dart';
import 'vista/auth/pantalla_verifica_email.dart';
import 'vista/usuario/pantalla_inicio.dart';
import 'vista/usuario/pantalla_perfil.dart';
import 'vista/reportes/pantalla_reporte_mascota.dart';

import 'vistamodelo/auth/recuperar_vm.dart';
import 'vistamodelo/auth/registro_vm.dart';
import 'vistamodelo/auth/login_vm.dart';
import 'servicios/api_dni_servicio.dart';
import 'vistamodelo/usuario/perfil_vm.dart';

final String bearer =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyOTUsImV4cCI6MTc1ODIzOTQxMX0.wX7JTrLUVGXvotDn376U462eIwzlA3PgzcM3sQ-mVX8";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiDniServicio(bearerToken: bearer);

    return MaterialApp(
      title: 'SosMascota',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      initialRoute: "/login",
      routes: {
        "/login": (_) => ChangeNotifierProvider(
          create: (_) => LoginVM(),
          child: const PantallaLogin(),
        ),
        "/registro": (_) => ChangeNotifierProvider(
          create: (_) => RegistroVM(apiDni: api), // ✅ corregido
          child: const PantallaRegistro(),
        ),
        "/recuperar": (_) => ChangeNotifierProvider(
          create: (_) => RecuperarVM(),
          child: const PantallaRecuperar(),
        ),
        "/verificaEmail": (_) => const PantallaVerificaEmail(),
        "/perfil": (_) => ChangeNotifierProvider(
          create: (_) => PerfilVM(),
          child: const PantallaPerfil(),
        ),
        "/inicio": (_) => const PantallaInicio(),

        "/reportarMascota": (_) => const PantallaReporteMascota(),
      },
    );
  }
}
