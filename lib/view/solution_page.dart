import 'package:cyberdoctor/controllers/list_solution.dart';
import 'package:cyberdoctor/models/problem_model.dart';
import 'package:cyberdoctor/utils/links.dart';
import 'package:cyberdoctor/view/widgets/list_solution_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SolutionPage extends StatelessWidget {
  final ProblemModel problem;

  const SolutionPage({Key? key, required this.problem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListSolution listSolution = context.read<ListSolution>();
    listSolution.getAll(problem.id);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Available Solution'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            Links.categoryicon + problem.category),
                        fit: BoxFit.cover)),
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Container(
                    alignment: const Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(Links.categoryicon + problem.category),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                problem.title,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Author: ${problem.author}",
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Solutions for the problem:",
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListSolutionWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.black, Colors.blueGrey]),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 100.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Add Solution",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.blueGrey, Colors.black]),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 100.0,
                          maxHeight: 40.0,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Denounce",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
