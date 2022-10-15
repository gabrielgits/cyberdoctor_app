import 'package:cyberdoctor/models/solution_model.dart';
import 'package:cyberdoctor/services/web_api_service.dart';
import 'package:flutter/material.dart';

class ListSolution extends ChangeNotifier {
  List<SolutionModel> lista = [];

  getAll(int problemId) async {
    lista.clear();
    var json = await WebApiService.getSolution(problemId);
    final List<dynamic> listJson = json['solutions'];
    for (var element in listJson) {
      SolutionModel item = SolutionModel.fromJson(element);
      lista.add(item);
    }
    notifyListeners();
  }
}