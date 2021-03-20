class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withOutInfo() {}

  String get getStatus {
    String mesaj;
    if (this.grade >= 50) {
      mesaj = 'Geçti';
    } else if (this.grade >= 40) {
      mesaj = 'Bütünleme';
    } else {
      mesaj = 'Kaldı';
    }
    return mesaj;
  }
}
