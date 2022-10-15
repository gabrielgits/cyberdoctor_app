import 'package:cyberdoctor/models/problem_model.dart';
import 'package:cyberdoctor/services/web_api_service.dart';
import 'package:flutter/material.dart';

class ListProblem extends ChangeNotifier {
  List<ProblemModel> list = [];
  List<ProblemModel> listSearch = [];

  getAll() async {
    list.clear();
    var json = await WebApiService.getProblems();
    final List<dynamic> datas = json['problems'];
    for (var element in datas) {
      list.add(ProblemModel.fromJson(element));
    }
    listSearch = list;
    notifyListeners();
  }

  ProblemModel get(int id) {
    for (var element in listSearch) {
      if (element.id == id) {
        return element;
      }
    }
    return ProblemModel(title: '', category: '', author: '', id: 0);
  }

  void runFilter(String enteredKeyword) {
    List<ProblemModel> listTemp = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      listTemp = list;
    } else {
      listTemp = list
          .where((item) =>
              item.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    listSearch = listTemp;
    notifyListeners();
  }
}
