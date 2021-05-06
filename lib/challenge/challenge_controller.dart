import 'package:flutter/foundation.dart';

class ChallengeConroller {
  final currentpageNotifier = ValueNotifier<int>(1);

  int rightAnswers = 0;

  int get currentPage => currentpageNotifier.value;
  
  set currentPage(int value) => currentpageNotifier.value = value;
}