
// ===============================
// Step 2: Encapsulation
// ===============================
class Student {
  String _name = "";
  int _age = 0;

  // Getter
  String get name => _name;
  int get age => _age;

  // Setter with validation
  set name(String value) {
    if (value.isNotEmpty) {
      _name = value;
    }
  }

  set age(int value) {
    if (value > 0) {
      _age = value;
    }
  }
}
void main(){
  Student s = Student();
  s.name= "Najim";
  s.age=26;
  print(s._name);
  print(s._age);
}
