
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
// Step 5: Singleton Pattern
// ===============================
class Database {
  static final Database _instance = Database._internal();

  Database._internal();

  factory Database() {
    return _instance;
  }

  void connect() {
    print("Database Connected");
  }
}

// ===============================
// Step 6: Mixins
// ===============================
mixin LoggerMixin {
  void showLog(String msg) {
    print("LOG: $msg");
  }
}

class Admin with LoggerMixin {}

class Manager with LoggerMixin {}

// ===============================
// Step 7: Extensions
// ===============================
extension NumberExtension on int {
  bool isEvenNumber() {
    return this % 2 == 0;
  }
}

// ===============================
// Step 8: Operator Overloading
// ===============================
class Product {
  String name;
  double price;

  Product(this.name, this.price);

  @override
  bool operator ==(Object other) {
    return other is Product &&
        other.name == name &&
        other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;

  @override
  String toString() {
    return "Product(name: $name, price: $price)";
  }
}

// ===============================
// Step 9: Copy Constructor Concept
// ===============================
class Car {
  String brand;
  int model;

  Car(this.brand, this.model);

  // Copy constructor
  Car.copy(Car other)
      : brand = other.brand,
        model = other.model;
}

// ===============================
// Step 10: Composition
// ===============================
class BankAccount {
  String accountHolder;
  double _balance;

  BankAccount(this.accountHolder, this._balance);

  // Getter
  double get balance => _balance;

  // Deposit
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("$amount deposited successfully.");
    } else {
      print("Invalid deposit amount.");
    }
  }

  // Withdraw
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("$amount withdrawn successfully.");
    } else {
      print("Insufficient balance or invalid amount.");
    }
  }

  void showBalance() {
    print("Current Balance: $_balance");
  }
}

class Customer {
  String name;
  BankAccount account;

  Customer(this.name, this.account);
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

  print("\n===== Singleton Pattern =====");
  Database db1 = Database();
  Database db2 = Database();

  db1.connect();

  print(db1 == db2);


  print("\n===== Mixins =====");
  Admin admin = Admin();
  admin.showLog("Admin Logged In");

  Manager manager = Manager();
  manager.showLog("Manager Logged In");


  print("\n===== Extensions =====");
  int number = 10;

  print(number.isEvenNumber());


  print("\n===== Operator Overloading =====");
  Product p1 = Product("Laptop", 50000);
  Product p2 = Product("Laptop", 50000);

  print(p1 == p2);

  print(p1);


  print("\n===== Copy Constructor =====");
  Car car1 = Car("Toyota", 2024);

  Car car2 = Car.copy(car1);

  print(car1.brand);
  print(car2.brand);


  print("\n===== Composition =====");
  BankAccount account = BankAccount("Najim", 1000);

  Customer customer = Customer("Najim Islam", account);

  print(customer.name);

  customer.account.showBalance();


  print("\n===== Bank Account System =====");

  BankAccount myAccount = BankAccount("Najim", 5000);

  myAccount.showBalance();

  myAccount.deposit(2000);

  myAccount.showBalance();

  myAccount.withdraw(1000);

  myAccount.showBalance();

  myAccount.withdraw(10000);
}