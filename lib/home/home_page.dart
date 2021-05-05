﻿import 'package:devquiz/challenge/challenge_page.dart';
import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = HomeController();

  @override
  void initState() { 
    super.initState();

    controller.getUser();
    controller.getQuizzes();
  
    controller.stateNotifier.addListener(() {
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {

    if(controller.state == HomeState.success){
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!,),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(label: "Fácil"),
                  LevelButtonWidget(label: "Médio"),
                  LevelButtonWidget(label: "Difícil"),
                  LevelButtonWidget(label: "Perito"),
                ],
              ),
              SizedBox(
                height: 20
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  children: controller.quizzes!.map((e) => QuizCardWidget(
                    title: e.title,
                    completed: "${e.questionsAnswered}/${e.questions.length}",
                    porcent: e.questionsAnswered / e.questions.length,
                    onTap: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => ChallengePage(
                            questions: e.questions,
                          )
                        )
                      );
                    },
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    }else{
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          )
        ),
      );
    }
  }
}