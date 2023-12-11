abstract class Role {
  void displayRole();
}

class Person implements Role {
  late String? name;
  late int? age;
  late String? address;

  Person(this.name, this.age, this.address);

  // Implementation in the derived classes
  @override
  displayRole() {
  }
}

class Student extends Person {
  late int? studentID;
  late String? grade;
  late List<int> courseScores = [];

  Student(String name, int age, String address, this.studentID, this.grade)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Student Information:");
    print("Role: Student");
  }

  double avgScr() {
    int sum = courseScores.reduce((a, b) => a + b);
    return sum / courseScores.length;
  }

  void displayAllInfo() {
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    print('Average Score: ${avgScr()}');
  }
}

class Teacher extends Person {
  late int? teacherID;
  List<String> courseTaught = [];

  Teacher(String name, int age, String address, this.teacherID)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Teacher Information:");
    print("Role: Teacher");
  }

  void coursesTaught() {
    print("Courses Taught:");
    for (String course in courseTaught) {
      print('- $course');
    }
  }

  void displayAllInfo() {
    displayRole();
    print('Name: $name');
    print('Age: $age');
    print('Address: $address');
    coursesTaught();
  }
}

void main() {
  Student stu_obj = Student('John Doe', 20, '123 Main St', 1, 'A');
  stu_obj.courseScores = [90, 85, 92];
  stu_obj.displayAllInfo();

  Teacher teac_obj = Teacher('Mrs. Smith', 35, '456 Oak St', 3);
  teac_obj.courseTaught = ['Math', 'English', 'Bangla'];
  teac_obj.displayAllInfo();
}