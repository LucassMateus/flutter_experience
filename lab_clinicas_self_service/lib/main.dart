import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:lab_clinicas_self_service_cb/pages/splash_page/splash_page.dart';

void main() {
  runApp(const LabCLinicasSelfServiceApp());
}


class LabCLinicasSelfServiceApp extends StatelessWidget {
  const LabCLinicasSelfServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
    title: 'Lab Clinicas Auto Atendimento',
    pagesBuilders: [
      FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/')
    ],);
  }
}
