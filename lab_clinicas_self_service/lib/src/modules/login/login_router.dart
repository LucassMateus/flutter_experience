import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/login/login_controller.dart';
import 'package:lab_clinicas_self_service_cb/src/modules/login/login_page.dart';
import 'package:lab_clinicas_self_service_cb/src/services/user/user_login_service.dart';
import 'package:lab_clinicas_self_service_cb/src/services/user/user_login_service_impl.dart';

class LoginRouter extends FlutterGetItModulePageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserLoginService>((i) => UserLoginServiceImpl(userRepository: i())),
        Bind.lazySingleton((i) => LoginController(loginService: i())),
      ];


  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
