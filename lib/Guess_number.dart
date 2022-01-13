import 'dart:io';
import 'dart:math';

import 'Game.dart';

void main() {
  List<int> myList1 = [];
  List<int> myList2 = [];
  stdout.write('Enter a maximum number to random: ');
  var r = stdin.readLineSync();
  var game = Game(r);
  var isCorrect = false;
  var boolean = false ;
  var count = 0;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and $r: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);
    var sum = game.sum;
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else if (result == 0) {
      print('║ ➜ $guess is CORRECT ❤, total guesses: $sum');
      count ++;
      myList1.add(count);
      myList2.add(sum);
      print('╟────────────────────────────────────────');

      print('║                 THE END                ');
      print('╚════════════════════════════════════════');
      isCorrect = false;
      boolean = false;
      do {
        stdout.write('Play again(Y/N):');
        var check = stdin.readLineSync();

        if (check == "Y" || check == "y") {
          isCorrect = false;
          boolean = true;
          stdout.write('Enter a maximum number to random: ');
          r = stdin.readLineSync();
          print('╔════════════════════════════════════════');
          print('║            GUESS THE NUMBER            ');
          print('╟────────────────────────────────────────');

        } else if (check == "N" || check == "n") {
          print("You've played " + count.toString() + ' games');

          for (var i = 1; i <= myList1.length; i++) {
            print('🚀 myGame #' + myList1[i].toString() + ': ' + myList2[i].toString() + ' guesses ');
          }

          isCorrect = true;
          boolean = true;
        }
      } while (!boolean);
    }
  } while (!isCorrect);
}

