import 'package:cyberdoctor/controllers/list_problem.dart';
import 'package:cyberdoctor/view/widgets/list_problem_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProblemPage extends StatefulWidget {
  const ProblemPage({Key? key}) : super(key: key);

  @override
  State<ProblemPage> createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  late ListProblem listProblem;


  @override
  initState() {
    listProblem = context.read<ListProblem>();
    listProblem.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Problems'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text('What has your device?'),
            const SizedBox(
              height: 10,
            ),
            TextField(
              onChanged: (value) => listProblem.runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search Problem', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListProblemWidget(),
          ],
        ),
      ),
    );
  }
}
