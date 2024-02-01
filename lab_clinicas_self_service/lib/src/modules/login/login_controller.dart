import 'package:signals_flutter/signals_flutter.dart';

class LoginController {
  final _obscurePassword = signal(true);
  bool get obscurePassword => _obscurePassword();


  void passwordToggle() => _obscurePassword.value = !_obscurePassword.value;
}
