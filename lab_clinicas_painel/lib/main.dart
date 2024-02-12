import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:lab_clinicas_painel/src/binding/lab_clinicas_application_binding.dart';
import 'package:lab_clinicas_painel/src/pages/login/login_router.dart';
import 'package:lab_clinicas_painel/src/pages/painel/painel_router.dart';
import 'package:lab_clinicas_painel/src/pages/splash/splash_page.dart';

void main() {
  runApp(const LabClinicasPainelApp());
}

class LabClinicasPainelApp extends StatelessWidget {
  const LabClinicasPainelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'Lab Clinicas Painel',
      binding: LabClinicasApplicationBinding(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      pages: const [
        LoginRouter(),
        PainelRouter(),
      ],
    );
  }
}
