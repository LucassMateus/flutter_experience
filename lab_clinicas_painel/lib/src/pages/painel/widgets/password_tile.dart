import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PasswordTile extends StatelessWidget {
  final String password;
  final String attendantDesk;

  const PasswordTile({
    Key? key,
    required this.password,
    required this.attendantDesk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: LabClinicasTheme.orangeColor),
      ),
      child: Column(
        children: [
          Text(
            password,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.blueColor,
            ),
          ),
          Text(
            attendantDesk,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LabClinicasTheme.orangeColor,
            ),
          )
        ],
      ),
    );
  }
}
