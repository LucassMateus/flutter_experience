import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_painel/src/models/painel_checkin_model.dart';
import 'package:lab_clinicas_painel/src/pages/painel/painel_controller.dart';
import 'package:lab_clinicas_painel/src/pages/painel/widgets/painel_principal_widget.dart';
import 'package:lab_clinicas_painel/src/pages/painel/widgets/password_tile.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PainelPage extends StatefulWidget {
  const PainelPage({super.key});

  @override
  State<PainelPage> createState() => _PainelPageState();
}

class _PainelPageState extends State<PainelPage> {
  final controller = Injector.get<PainelController>();

  @override
  void initState() {
    controller.listenerPainel();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);

    final PainelCheckinModel? current;
    final PainelCheckinModel? lastCall;
    final List<PainelCheckinModel>? others;

    final listPanel = controller.painelData.watch(context);

    current = listPanel.firstOrNull;
    if (listPanel.isNotEmpty) {
      listPanel.removeAt(0);
    }

    lastCall = listPanel.firstOrNull;
    if (listPanel.isNotEmpty) {
      listPanel.removeAt(0);
    }

    others = listPanel;

    return Scaffold(
      appBar: LabClinicasAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                lastCall != null
                    ? SizedBox(
                        width: sizeOf.width * .40,
                        child: PainelPrincipalWidget(
                          label: 'Senha Anterior',
                          password: lastCall.password,
                          deskNumber:
                              lastCall.attendantDesk.toString().padLeft(2, '0'),
                          labelColor: LabClinicasTheme.orangeColor,
                          buttonColor: LabClinicasTheme.blueColor,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 24),
                current != null
                    ? SizedBox(
                        width: sizeOf.width * .40,
                        child: PainelPrincipalWidget(
                          label: 'Chamando Senha',
                          password: current.password,
                          deskNumber:
                              current.attendantDesk.toString().padLeft(2, '0'),
                          labelColor: LabClinicasTheme.blueColor,
                          buttonColor: LabClinicasTheme.orangeColor,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 40),
            const Divider(color: LabClinicasTheme.orangeColor),
            const SizedBox(height: 30),
            const Text(
              'Últimos chamados',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: LabClinicasTheme.orangeColor,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: others
                  .map((p) => PasswordTile(
                        password: p.password,
                        attendantDesk: p.attendantDesk.toString(),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
