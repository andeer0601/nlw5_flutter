import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

import 'home_repository.dart';

class HomeController {

  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  
  HomeState get state => stateNotifier.value;

  UserModel? user; 
  List<QuizModel>? quizzes;

  final repository = HomeRepository();
  var userCheck = 0;
  var quizCheck = 0;

  void getUser() async{
    state = HomeState.loading;

    user = await repository.getUser();
    userCheck = 1;
    isCheck();
  }

  void getQuizzes() async{
    state = HomeState.loading;

    quizzes = await repository.getQuizzes();
    quizCheck = 1;
    isCheck();
  }

  void isCheck(){
    if(userCheck == 1 && quizCheck == 1)
      state = HomeState.success;
  }

}