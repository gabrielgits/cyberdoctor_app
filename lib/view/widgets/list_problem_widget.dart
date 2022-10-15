import 'package:cyberdoctor/controllers/list_problem.dart';
import 'package:cyberdoctor/view/widgets/web_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListProblemWidget extends StatelessWidget {
  const ListProblemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListProblem listProblem = context.watch<ListProblem>();
    return Expanded(
      child: listProblem.listSearch.isNotEmpty
          ? ListView.builder(
              itemCount: listProblem.listSearch.length,
              itemBuilder: (context, index) => Card(
                key: ValueKey(listProblem.listSearch[index].id),
                color: Colors.lightBlueAccent,
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: WebIconWidget(
                    filename: listProblem.listSearch[index].category,
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    listProblem.listSearch[index].title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/solution',
                      arguments: listProblem.listSearch[index],
                    );
                  },
                ),
              ),
            )
          : const Text(
              'No Problem Found...',
              style: TextStyle(fontSize: 24),
            ),
    );
  }
}
