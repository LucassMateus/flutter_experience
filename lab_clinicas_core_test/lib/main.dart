import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:lab_clinicas_core_test/home_controller.dart';
import 'package:asyncstate/asyncstate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(title: 'Lab Clinicas Teste', pagesBuilders: [
      FlutterGetItPageBuilder(page: (_) => MyHomePage(title: 'Flutter GetIT'), path: '/')
    ],);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with MessagesViewMixin{
  int _counter = 0;
  final controller = HomeController();


  @override
  void initState() {
    messageListener(controller);
    super.initState();
  }

  void _incrementCounter() async {
    // controller.fazerAlgo();
    await Future.delayed(const Duration(seconds: 5)).asyncLoader();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
 