import 'dart:io';

// 1. Parent Class
class Question {  // contains blueprint for the child class
  String questionText;
  int correctAnswer;

  Question(this.questionText, this.correctAnswer);

  void ask() {
    print('\n$questionText');
  }
}

// 2. Child Class
class MCQ extends Question {
  List<String> options;

  MCQ(String questionText, this.options, int correctAnswer)
      : super(questionText, correctAnswer);

  @override
  void ask() {
    print('\n$questionText');

    for (int i = 0; i < options.length; i++) {
      print('${i + 1}. ${options[i]}');
    }
  }
}

// 3. Main Function
void main() {
  print('==============================');
  print('       SMART QUIZ APP         ');
  print('==============================');

  stdout.write('Enter your name: ');
  String name = stdin.readLineSync() ?? 'Student';

  // Question Bank
  List<MCQ> quizList = [    // here<MCQ> work as a generic type to specify that 
                            //the list will contain objects of type MCQ
    MCQ('Which keyword is used for inheritance in Dart?', [
      'this', 'extends', 'super', 'class'
    ], 2),

    MCQ('Which data type stores true or false values?', [
      'int', 'String', 'bool', 'double'
    ], 3),

    MCQ('Which collection stores ordered items by index?', [
      'Set', 'Map', 'List', 'Tuple'
    ], 3),
  ];

  // RANDOMIZE QUESTIONS
  quizList.shuffle();

  int score = 0;

  // Loop through randomized questions
  for (int i = 0; i < quizList.length; i++) {
    MCQ q = quizList[i];

    print('\nQuestion ${i + 1}/${quizList.length}');

    q.ask();

    stdout.write('Your answer (1-${q.options.length}): ');

    String? input = stdin.readLineSync();
    int? userChoice = int.tryParse(input ?? '');

    if (userChoice == q.correctAnswer) {
      print('Status: Correct!');
      score++;
    } else {
      print('Status: Wrong! Correct answer was option ${q.correctAnswer}');
    }
  }

  print('\n------------------------------');
  print('Well done $name!');
  print('Final Score: $score / ${quizList.length}');
  print('------------------------------');
}