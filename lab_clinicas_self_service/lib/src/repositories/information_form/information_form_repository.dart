import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_self_service_cb/src/models/self_service_model.dart';

abstract interface class InformationFormRepository {
  Future<Either<RepositoryException, Unit>> register(SelfServiceModel model);
}