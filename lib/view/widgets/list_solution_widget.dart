import 'package:cyberdoctor/controllers/list_solution.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListSolutionWidget extends StatelessWidget {
  const ListSolutionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListSolution listSolution = context.watch<ListSolution>();
    return Expanded(
      child: listSolution.lista.isNotEmpty
          ? ListView.builder(
              itemCount: listSolution.lista.length,
              itemBuilder: (context, index) => Card(
                key: ValueKey(listSolution.lista[index].id),
                color: Colors.lightBlueAccent,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text(
                    'By: ${listSolution.lista[index].author}',
                    style: const TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    listSolution.lista[index].solution,
                    style: const TextStyle(fontSize: 17),
                  ),
                ),
              ),
            )
          : const Text(
              'No Solution Available...',
              style: TextStyle(fontSize: 24),
            ),
    );
  }
}
