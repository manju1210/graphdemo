import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphdemo/screens/graph_screen.dart';
import 'package:graphdemo/screens/sync_graph_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graph Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SyncfusionGraphScreen(),
      // home: GraphScreen(),
    );
  }
}

