
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

// ===============================
// Step 3: Static Variables & Methods
// ===============================
class Employee {
  static int count = 0;

  Employee() {
    count++;
  }

  static void showCount() {
    print("Total Employees: $count");
  }
}

// ===============================
// Step 4: Factory Constructor
// ===============================
class Logger {
  static final Map<String, Logger> _cache = {};

  String name;

  // Private constructor
  Logger._internal(this.name);

  // Factory constructor
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  void log(String message) {
    print("[$name]: $message");
  }
}
// ===============================
// Main Function
// ===============================
void main() {

  print("===== Encapsulation =====");
  Student s = Student();

  s.name = "Najim";
  s.age = 22;

  print("Name: ${s.name}");
  print("Age: ${s.age}");


  print("\n===== Static Variables =====");
  Employee e1 = Employee();
  Employee e2 = Employee();

  Employee.showCount();


  print("\n===== Factory Constructor =====");
  Logger log1 = Logger("App");
  Logger log2 = Logger("App");

  log1.log("Application Started");

  print(log1 == log2);

}