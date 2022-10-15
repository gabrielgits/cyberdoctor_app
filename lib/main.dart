import 'package:cyberdoctor/controllers/list_problem.dart';
import 'package:cyberdoctor/controllers/list_solution.dart';
import 'package:cyberdoctor/models/problem_model.dart';
import 'package:cyberdoctor/view/problem_page.dart';
import 'package:cyberdoctor/view/home_page.dart';
import 'package:cyberdoctor/view/solution_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ListProblem()),
        ChangeNotifierProvider(create: (context) => ListSolution()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String title = 'CyberDoctor';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/problem': (context) => const ProblemPage(),
        '/solution': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as ProblemModel;
          return SolutionPage(problem: args);
        },
        //home: MyHomePage(),
      },
    );
  }
}