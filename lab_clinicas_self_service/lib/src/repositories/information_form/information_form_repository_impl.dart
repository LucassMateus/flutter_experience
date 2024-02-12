import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service_cb/src/models/patient_model.dart';

import 'package:lab_clinicas_self_service_cb/src/models/self_service_model.dart';

import './information_form_repository.dart';

class InformationFormRepositoryImpl implements InformationFormRepository {
  final RestClient restClient;
  InformationFormRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, Unit>> register(
      SelfServiceModel model) async {
    try {
      final SelfServiceModel(
        :firstName!,
        :lastName!,
        patient: PatientModel(id: patientId)!,
        documents: {
          DocumentType.healthInsureCard: List(first: healthInsureCardDoc),
          DocumentType.medicalOrder: medicalOrderDocs,
        }!
      ) = model;
      await restClient.auth.post('patientInformationForm', data: {
        'patient_id': patientId,
        'health_insure_card': healthInsureCardDoc,
        'medical_order': medicalOrderDocs,
        'password': '$firstName $lastName',
        'date_created': DateTime.now().toIso8601String(),
        'status': 'Waiting',
        'tests': [],
      });

      return Right(unit);
    } on DioException catch (e, s) {
      log(
        'Erro ao finalizar formulário de auto atendimento',
        error: e,
        stackTrace: s,
      );
      return Left(RepositoryException());
    }
  }
}
