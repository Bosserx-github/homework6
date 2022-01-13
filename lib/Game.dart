import 'dart:math';

class Game {
  //List<int> myList = [];
  //var maxRandom;
  static const maxRandom = 100;
  int? _answer;

  int Count = 0;
  int sum = 0;
  //var maxrandoms;

  Game(var maxRd) {
    //maxRandom = maxRd;
    //var r = Random();
    //maxrandoms = int.tryParse(maxRandom!);
    _answer = maxRd;
  }

  int doGuess(int num) {
    if (num > _answer!) {
      Count++;
      sum = Count;
      return 1;

    } else if (num < _answer!) {
      Count++;
      sum = Count;
      return -1;
    } else {
      Count++;
      sum = Count;
      //var r = Random();
     // _answer = r.nextInt(maxrandoms!) + 1;
     // Count = 0;
      //myList.add(Count);
      return 0;
    }
  }
}
