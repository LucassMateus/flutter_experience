import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_core/src/loader/lab_clinicas_loader.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;
  final VoidCallback? didStart;

  const LabClinicasCoreConfig({
    super.key,
    required this.title,
    this.binding,
    this.pages,
    this.pagesBuilders,
    this.modules,
    this.didStart,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: binding,
      pages: [...pages ?? [], ...pagesBuilders ?? []],
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
            loader: LabClinicasLoader(),
            builder: (navigatorObserver) {
              if (didStart != null) {
                didStart!();
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: LabClinicasTheme.lightTheme,
                darkTheme: LabClinicasTheme.lightTheme,
                navigatorObservers: [
                  navigatorObserver,
                  flutterGetItNavObserver
                ],
                routes: routes,
                title: title,
              );
            });
      },
    );
  }
}
