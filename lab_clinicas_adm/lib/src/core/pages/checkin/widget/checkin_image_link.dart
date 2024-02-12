import 'package:flutter/material.dart';
import 'package:lab_clinicas_adm/src/core/pages/checkin/widget/checkin_image_dialog.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class CheckinImageLink extends StatelessWidget {
  final String label;
  final String image;

  const CheckinImageLink({
    Key? key,
    required this.label,
    required this.image,
  }) : super(key: key);

  void showImageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CheckinImageDialog(context, pathImage: image);
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: LabClinicasTheme.blueColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onTap: () => showImageDialog(context),
    );
  }
}
