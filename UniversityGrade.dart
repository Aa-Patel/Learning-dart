void main() {
  Theory course1 = Theory(90, 80, 80, 0, 0, 0, "Mathematics");
  Theory course2 = Theory(90, 90, 80, 0, 0, 0, "Statistics");

  Lab course3 = Lab("python", 0, 0, 0, 90, 90, 100);
  print("${course1.getGrade()}, ${course1.final_score()}");
  print("${course2.getGrade()}, ${course2.final_score()}");
  print("${course3.getGrade()}, ${course3.final_score()}");
}

abstract class Course {
  int assignment, midterm, final_exam, lab, project, viva;
  String name;

  Course(
    this.name,
    this.assignment,
    this.midterm,
    this.final_exam,
    this.lab,
    this.project,
    this.viva,
  ) {}

  List<int> get scores => [assignment, midterm, final_exam, lab, project, viva];

  double final_score() {
    int n = 0;
    for (var score in scores) {
      if (score != 0) {
        n += 1;
      } else {
        continue;
      }
    }
    return (assignment + midterm + final_exam + lab + project + viva) / n;
  }

  String getGrade() {
    if (final_score() > 90) {
      return 'A';
    } else if (80 < final_score() && final_score() <= 89) {
      return 'B';
    } else if (70 < final_score() && final_score() <= 79) {
      return 'C';
    } else {
      return 'F';
    }
  }
}

class Theory extends Course {
  Theory(
    int assignment,
    int midterm,
    int final_exam,
    int lab,
    int project,
    int viva,
    String name,
  ) : super(name, assignment, midterm, final_exam, lab, project, viva);
}

class Lab extends Course {
  Lab(
    String name,
    int assignment,
    int midterm,
    int final_exam,
    int lab,
    int project,
    int viva,
  ) : super(name, assignment, midterm, final_exam, lab, project, viva);
}
