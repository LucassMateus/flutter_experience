import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service_cb/src/models/patient_model.dart';
import 'package:lab_clinicas_self_service_cb/src/repositories/patient/patient_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({
    required PatientRepository patientRepository,
  }) : _patientRepository = patientRepository;

  final PatientRepository _patientRepository;

  final _patientNotFound = ValueSignal<bool?>(null);
  final _patien = ValueSignal<PatientModel?>(null);

  bool? get patientNotFound => _patientNotFound.value;
  PatientModel? get patien => _patien.value;

  Future<void> findPatientByDocument(String document) async {
    final patientResult =
        await _patientRepository.findPatientByDocument(document);

    bool patientNotFound;
    PatientModel? patien;

    switch (patientResult) {
      case Right(value: PatientModel model?):
        patientNotFound = false;
        patien = model;
      case Right(value: _):
        patientNotFound = true;
        patien = null;
      case Left():
        showError('Erro ao buscar paciente');
        return;
    }

    batch(() {
      _patien.forceUpdate(patien);
      _patientNotFound.forceUpdate(patientNotFound);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      // _patien.forceUpdate(null);
      _patien.value = null;
      _patientNotFound.forceUpdate(true);
    });
  }
}
