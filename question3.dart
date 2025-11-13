// Question 3: Classes & Objects (Difficulty: 3/5) ⭐⭐⭐
// Create a BankAccount class with the following specifications:
class BankAccount {
  // 1. Properties:
  String accountNumber;
  String accountHolder;
  double balance;
  String accountType;

  // 2. Constructor:
  //    - Initialize all properties
  //    - Set initial balance to 0.0
  BankAccount(this.accountNumber, this.accountHolder, this.accountType) : balance = 0.0;

  // 3. Methods:
  //    - deposit(double amount): Add money to account
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Deposited \$${amount.toStringAsFixed(2)} to account $accountNumber. New balance: \$${balance.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive. No deposit made.');
    }
  }

  //    - withdraw(double amount): Remove money from account (check for sufficient funds)
  void withdraw(double amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be positive. No withdrawal made.');
      return;
    }
    if (balance >= amount) {
      balance -= amount;
      print('Withdrew \$${amount.toStringAsFixed(2)} from account $accountNumber. New balance: \$${balance.toStringAsFixed(2)}');
    } else {
      print('Error: Insufficient funds in account $accountNumber. Attempted to withdraw \$${amount.toStringAsFixed(2)}, but only \$${balance.toStringAsFixed(2)} available.');
    }
  }

  //    - getBalance(): Return current balance
  double getBalance() {
    return balance;
  }

  //    - displayAccountInfo(): Show account details
  void displayAccountInfo() {
    print('\n--- Account Information ---');
    print('Account Number: $accountNumber');
    print('Account Holder: $accountHolder');
    print('Account Type: $accountType');
    print('Current Balance: \$${balance.toStringAsFixed(2)}');
    print('---------------------------\n');
  }
}

void main() {
  // 4. Create 3 bank accounts and demonstrate:
  //    - Depositing money
  //    - Withdrawing money
  //    - Displaying account information
  //    - Handling insufficient funds scenario

  // Create 3 bank accounts
  final BankAccount account1 = BankAccount('12345', 'Alice', 'Savings');
  final BankAccount account2 = BankAccount('67890', 'Bob', 'Checking');
  final BankAccount account3 = BankAccount('11111', 'Charlie', 'Savings');

  print('--- Initial Account Information ---');
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();

  // Demonstrate depositing money
  print('\n--- Demonstrating Deposits ---');
  account1.deposit(1000);
  account2.deposit(500);
  account3.deposit(2000);
  account1.deposit(-50); // Invalid deposit

  // Display account information after deposits
  print('\n--- Account Information After Deposits ---');
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();

  // Demonstrate withdrawing money
  print('\n--- Demonstrating Withdrawals ---');
  account1.withdraw(200);
  account2.withdraw(100);
  account3.withdraw(500);
  account2.withdraw(-20); // Invalid withdrawal

  // Display account information after withdrawals
  print('\n--- Account Information After Withdrawals ---');
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();

  // Demonstrate insufficient funds scenario
  print('\n--- Demonstrating Insufficient Funds ---');
  account2.withdraw(1000); // This should show insufficient funds message
  account1.withdraw(10000); // Another insufficient funds scenario

  // Final account balances
  print('\n--- Final Account Balances ---');
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();
}