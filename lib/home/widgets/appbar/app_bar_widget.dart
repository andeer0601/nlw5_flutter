import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/widgets.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich( 
                  TextSpan(
                    text: "Olá, ", 
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: "Anderson", 
                        style: AppTextStyles.titleBold
                      )
                    ]
                  ),
                ),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage( 
                      image: NetworkImage("https://media-exp1.licdn.com/dms/image/C4D03AQFbxpt679NYkw/profile-displayphoto-shrink_200_200/0/1615669888024?e=1625097600&v=beta&t=3SgGGBlFLVANqfzJeF6wM6CnpZZjcjRcjblviIfFjvU"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ScoreCardWidget()
          ),
        ],
      ),
    ),
  );

}