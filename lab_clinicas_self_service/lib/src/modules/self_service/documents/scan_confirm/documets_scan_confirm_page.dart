import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/self_service/documents/scan_confirm/documents_scan_confirm_controller.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/self_service/widgets/lab_clinicas_self_service_app_bar.dart';
import 'package:signals_flutter/signals_flutter.dart';

class DocumentsScanConfirmPage extends StatelessWidget {
  DocumentsScanConfirmPage({super.key});

  final controller = Injector.get<DocumentsScanConfirmController>();

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final foto = ModalRoute.of(context)!.settings.arguments as XFile;

    controller.pathRemoteStorage.listen(context, () {
      Navigator.of(context).pop();
      Navigator.of(context).pop(controller.pathRemoteStorage.value);
    });

    return Scaffold(
      appBar: LabClinicasSelfServiceAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Container(
            width: sizeOf.width * .85,
            margin: const EdgeInsets.only(top: 18),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/foto_confirm_icon.png'),
                const SizedBox(height: 15),
                const Text(
                  'CONFIRA SUA FOTO',
                  style: LabClinicasTheme.titleSmallStyle,
                ),
                const SizedBox(height: 32),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    width: sizeOf.width * .5,
                    child: DottedBorder(
                        dashPattern: const [1, 10, 1, 3],
                        borderType: BorderType.RRect,
                        strokeWidth: 4,
                        radius: const Radius.circular(16),
                        color: LabClinicasTheme.orangeColor,
                        strokeCap: StrokeCap.square,
                        child: Image.file(File(foto.path))),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('TIRAR OUTRA'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            final imageBytes = await foto.readAsBytes();
                            final fileName = foto.name;
                            await controller.uploadImage(imageBytes, fileName);
                          },
                          child: const Text('SALVAR'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
