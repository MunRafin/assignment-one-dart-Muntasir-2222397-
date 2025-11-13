void main(){
  String name = 'Muntasir' ;
  int score = 75;
  int age= 20;
  double height = 1.78;
  const double weight = 80;
  bool status = true;
  
  double calculateBMI(double weight, double height){
    var b = weight / height * height ;
    return b;  
  }
  var bmi= calculateBMI(weight, height);
  
  String getGrade(score) {
    if (score >= 90) {
      return 'A';
    } else if (score >= 80) {
      return 'B';
    } else if (score >= 70) {
      return 'C';
    } else if (score >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }
  
 var grade = getGrade(score);
  
 print('Name: $name, Age: $age, Height: $height, Is Student: $status, BMI: $bmi \nGrade: $grade ');
  
}