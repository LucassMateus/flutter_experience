import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/auth/auth_module.dart';
import 'package:lab_clinicas_self_service_cb/src/pages/splash_page/splash_page.dart';
import 'package:lab_clinicas_self_service_cb/src/binding/lab_clinicas_application_binding.dart';

void main() {
  runApp(const LabCLinicasSelfServiceApp());
}


class LabCLinicasSelfServiceApp extends StatelessWidget {
  const LabCLinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
    title: 'Lab Clinicas Auto Atendimento',
    binding: LabClinicasApplicationBinding(),
    pagesBuilders: [
      FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/')
    ],
    modules: [AuthModule()],
    );
  }
}
