import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_painel/src/pages/painel/painel_controller.dart';
import 'package:lab_clinicas_painel/src/pages/painel/painel_page.dart';
import 'package:lab_clinicas_painel/src/repositories/painel_checkin/painel_checkin_repository.dart';
import 'package:lab_clinicas_painel/src/repositories/painel_checkin/painel_checkin_repository_impl.dart';

class PainelRouter extends FlutterGetItPageRouter {
  const PainelRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<PainelCheckinRepository>(
            (i) => PainelCheckinRepositoryImpl(restClient: i())),
        Bind.lazySingleton((i) => PainelController(repository: i())),
      ];

  @override
  String get routeName => '/panel';

  @override
  WidgetBuilder get view => (_) => const PainelPage();
}
