import 'package:sabak15_quize_app/model.dart';

class UseQuize {
  int index = 0;
  List<QuizeModel> surooJoop = [
    QuizeModel(suroo: 'Кыргызстанда 7 облус барбы?', joop: true),
    QuizeModel(suroo: 'Сулайман Тоо Баткендеби?', joop: false),
    QuizeModel(suroo: 'Маймыл бакка чыга алабы?', joop: true),
    QuizeModel(
        suroo: 'Гугл корпорациясынын кеңсеси Кыргызстанда жайгашканбы?',
        joop: false),
    QuizeModel(suroo: 'Балык сууда жаайбы?', joop: true),
  ];

  String surooAluu() {
    return surooJoop[index].suroo;
  }

  bool joopAluu() {
    return surooJoop[index].joop;
  }

  void nextQuestion() {
    if (index <= surooJoop.length) {
      index++;
    }
  }

  bool isFinished() {
    if (surooJoop[index] == surooJoop.last) {
      return true;
    } else {
      return false;
    }
  }

  void indexZero() {
    index = 0;
  }
}
