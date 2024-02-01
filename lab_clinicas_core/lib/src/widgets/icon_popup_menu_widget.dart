import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/src/restClient/theme/lab_clinica_theme.dart';

class IconPopupMenuWidget extends StatelessWidget {
  const IconPopupMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: LabClinicaTheme.orangeColor, width: 2)),
        child: const Icon(Icons.more_horiz_rounded,color: LabClinicaTheme.orangeColor),
      ),
    );
  }
}
