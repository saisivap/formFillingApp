import 'package:flutter/material.dart';
import 'package:form_flutter/form_fill.dart';
import 'package:form_flutter/inform_model.dart';
import 'package:form_flutter/information.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String informationModelName = "inform";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(InfromModelAdapter());
  await Hive.openBox<InfromModel>(informationModelName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: FormFill(),
      body: Information(),
    );
  }
}
