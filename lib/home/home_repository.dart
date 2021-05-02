import 'dart:convert';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async{
    var response = await rootBundle.loadString("assets/database/user.json");

    var user = UserModel.fromJson(response);

    return user;
  }

  Future<List<QuizModel>> getQuizzes() async{
    var response = await rootBundle.loadString("assets/database/quizzes.json");

    var list = jsonDecode(response) as List;

    var quizzes = list.map((e) => QuizModel.fromMap(e)).toList();

    return quizzes;
  }
}