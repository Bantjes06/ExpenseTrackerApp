import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

// Enum for categorizing expenses.
enum Category { food, travel, leisure, work }

// Mapping of categories to icons
const categoryIcon = {
  Category.food: Icons.dining,
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.desktop_mac_outlined,
  Category.work: Icons.work
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

// Utility property to get a formatted date string
  String get formatteddate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});
// Constructor to generate a bucket based on the category.
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : expenses = allExpenses.where((expense) => expense.category == category).toList();
  final Category category;
  final List<Expense> expenses;

// Utility property to calculate the total amount in the bucket.
  double get totalExpense {
    double sum = 0;
    for (final expense in expenses){
      sum += expense.amount;
    }
    return sum;
  }
}