import 'dart:math';

void main() {
  // 1. Create a List<String> of student names: ["Alice", "Bob", "Charlie", "Diana", "Eve"]
  final studentNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"];

  // 2. Create a Map<String, int> to store student scores
  final studentScores = <String, int>{};

  // 3. Use a for loop to assign random scores (60-100) to each student
  final random = Random();
  for (final student in studentNames) {
    // Generates a random integer between 0 (inclusive) and 41 (exclusive), then adds 60.
    // This results in scores from 60 to 100.
    final score = random.nextInt(41) + 60;
    studentScores[student] = score;
  }

  // 4. Find and display:
  //    - The student with the highest score
  //    - The student with the lowest score
  //    - The average score of all students
  String highestStudent = '';
  int highestScore = -1; // Scores are 60-100, so -1 ensures the first score will be higher
  String lowestStudent = '';
  int lowestScore = 101; // Scores are 60-100, so 101 ensures the first score will be lower
  int totalScore = 0;

  for (final entry in studentScores.entries) {
    final student = entry.key;
    final score = entry.value;

    if (score > highestScore) {
      highestScore = score;
      highestStudent = student;
    }
    if (score < lowestScore) {
      lowestScore = score;
      lowestStudent = student;
    }
    totalScore += score;
  }

  final averageScore = studentScores.isNotEmpty ? totalScore / studentScores.length : 0.0;

  print('Student Scores: $studentScores');
  print('Highest Score: $highestStudent with $highestScore');
  print('Lowest Score: $lowestStudent with $lowestScore');
  print('Average Score: ${averageScore.toStringAsFixed(2)}'); // Format average to 2 decimal places

  print('\n--- Student Categories ---');
  // 5. Use a switch statement to categorize students:
  //    - 90-100: "Excellent"
  //    - 80-89: "Good"
  //    - 70-79: "Average"
  //    - Below 70: "Needs Improvement"
  for (final student in studentNames) {
    final score = studentScores[student]!; // We know every student has a score
    var category = '';

    switch (score ~/ 10) { // Integer division to get the tens digit
      case 10: // Scores from 100
      case 9: // Scores from 90-99
        category = 'Excellent';
        break;
      case 8: // Scores from 80-89
        category = 'Good';
        break;
      case 7: // Scores from 70-79
        category = 'Average';
        break;
      default: // Scores below 70 (60-69 in this case)
        category = 'Needs Improvement';
    }

    print('$student: $score ($category)');
  }
}