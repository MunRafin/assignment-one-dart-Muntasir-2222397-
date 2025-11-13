mixin Payable {
  double calculateSalary(double baseSalary, double bonus) {
    return baseSalary + bonus;
  }

  void processPayment(double amount) {
    print('Processing payment of \$${amount.toStringAsFixed(2)}.');
  }
}

mixin Reportable {
  String generateReport(String employeeName, String department) {
    return '--- Report for $employeeName in $department ---\n'
           'Payment processed and performance reviewed.\n'
           'This report confirms $employeeName\'s standing within the $department.';
  }
}

abstract class Employee {
  Employee(this.name, this.id, this.department);

  String name;
  String id;
  String department;

  String getJobTitle();
  double getBaseSalary();

  void displayInfo() {
    print('Name: $name (ID: $id)');
    print('Department: $department');
    print('Job Title: ${getJobTitle()}');
    print('Base Salary: \$${getBaseSalary().toStringAsFixed(2)}');
  }
}

class Manager extends Employee with Payable, Reportable {
  Manager(super.name, super.id, super.department, this.teamSize);

  int teamSize;

  @override
  String getJobTitle() {
    return 'Manager';
  }

  @override
  double getBaseSalary() {
    return 95000.0; // Example base salary for a Manager
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('Team Size: $teamSize');
  }
}

class Developer extends Employee with Payable {
  Developer(super.name, super.id, super.department, this.programmingLanguage);

  String programmingLanguage;

  @override
  String getJobTitle() {
    return 'Developer';
  }

  @override
  double getBaseSalary() {
    return 70000.0; // Example base salary for a Developer
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print('Programming Language: $programmingLanguage');
  }
}

/// Processes an employee's information, salary, payment, and report if applicable.
///
/// [employee]: The Employee object to process.
/// [bonus]: The bonus amount for the employee.
/// [baseSalaryAdjustment]: An optional adjustment to the employee's base salary
///   before calculating total salary (e.g., for senior roles).
void processEmployee(
  Employee employee,
  double bonus, {
  double baseSalaryAdjustment = 0.0,
}) {
  print('--- Processing ${employee.name} (${employee.getJobTitle()}) ---');
  employee.displayInfo();

  if (employee is Payable) {
    final payableEmployee = employee as Payable;
    final effectiveBaseSalary = employee.getBaseSalary() + baseSalaryAdjustment;
    final totalAnnualSalary = payableEmployee.calculateSalary(effectiveBaseSalary, bonus);

    print('\n  --- Salary Details ---');
    print('  Base Salary (effective): \$${effectiveBaseSalary.toStringAsFixed(2)}');
    print('  Bonus: \$${bonus.toStringAsFixed(2)}');
    print('  Total Annual Salary: \$${totalAnnualSalary.toStringAsFixed(2)}');
    payableEmployee.processPayment(totalAnnualSalary / 12); // Process monthly payment
  } else {
    print('\n  This employee is not eligible for direct payment processing.');
  }

  if (employee is Reportable) {
    final reportableEmployee = employee as Reportable;
    print('\n  --- Report ---');
    final report = reportableEmployee.generateReport(employee.name, employee.department);
    print(report);
  }
  print('-------------------------------------\n');
}

void main() {
  final manager = Manager('Alice Smith', 'MGR001', 'Engineering', 12);
  final developer = Developer('Bob Johnson', 'DEV001', 'Engineering', 'Dart');
  final seniorDeveloper = Developer('Charlie Brown', 'DEV002', 'Engineering', 'Flutter');

  // Process each employee using the helper function
  processEmployee(manager, 15000.0);
  processEmployee(developer, 5000.0);
  processEmployee(seniorDeveloper, 8000.0, baseSalaryAdjustment: 20000.0);
}