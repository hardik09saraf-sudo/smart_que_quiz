import 'dart:io';

// 1. Parent Class
//this is the parent class which is used to create the child class and questionText
// and correctAnswer are the properties of this class and they are initialized by
// constructor of this class
class Question {
  // Blueprint for Question and Answer
  String questionText;
  int correctAnswer;

  Question(this.questionText, this.correctAnswer); // Constructor of class Question and it is called when we create object of class Question

  void ask() {
    //this is method of class Question and it can be called by object of class Question
    print('\n$questionText');
  }
}

// 2. Child Class (Inheritance)
class MCQ extends Question { // here mcq is child class which is inheriting the properties 
//and methods of parent class Question and has ability to have its own properties and methods
  // this is
  List<String> options; // here options is property of class MCQ 
  //and it is list of string which is used to store the options of question

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

  // Question bank
  List<MCQ> quizList = [
    MCQ('Which keyword is used for inheritance in Dart?', [
      'this',
      'extends',
      'super',
      'class',
    ], 2),
    MCQ('Which data type stores true or false values?', [
      'int',
      'String',
      'bool',
      'double',
    ], 3),
    MCQ('Which collection stores ordered items by index?', [
      'Set',
      'Map',
      'List',
      'Tuple',
    ], 3),
  ];

  int score = 0;

  // Loop through questions and wait for user typing
  for (int i = 0; i < quizList.length; i++) {
    MCQ q = quizList[i];
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