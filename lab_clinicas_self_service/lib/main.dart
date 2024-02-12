import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/auth/auth_module.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/home/home_module.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/self_service/self_service_module.dart';
import 'package:lab_clinicas_self_service_cb/src/pages/splash_page/splash_page.dart';
import 'package:lab_clinicas_self_service_cb/src/binding/lab_clinicas_application_binding.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    _cameras = await availableCameras();

    runApp(const LabCLinicasSelfServiceApp());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
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
      modules: [
        AuthModule(),
        HomeModule(),
        SelfServiceModule(),
      ],
      didStart: () {
        FlutterGetItBindingRegister.registerPermanentBinding(
          'CAMERAS',
          [Bind.lazySingleton((i) => _cameras)],
        );
      },
    );
  }
}
