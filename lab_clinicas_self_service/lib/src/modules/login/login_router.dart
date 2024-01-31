import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/login/login_controller.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/login/login_page.dart';
import 'package:lab_clinicas_self_service_cb/src/services/user_login_service_impl.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton((i) => UserLoginServiceImpl(userRepository: i())),
        Bind.lazySingleton((i) => LoginController()),
      ];


  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
