import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PainelPrincipalWidget extends StatelessWidget {
  const PainelPrincipalWidget({
    Key? key,
    required this.label,
    required this.password,
    required this.deskNumber,
    required this.labelColor,
    required this.buttonColor,
  }) : super(key: key);

  final String label;
  final String password;
  final String deskNumber;
  final Color labelColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: LabClinicasTheme.orangeColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: buttonColor,
            ),
            child: Text(
              password,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Guichê',
            style: LabClinicasTheme.titleStyle.copyWith(color: labelColor),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: buttonColor,
            ),
            child: Text(
              deskNumber,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
