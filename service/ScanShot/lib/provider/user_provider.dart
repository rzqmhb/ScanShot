import 'package:flutter/material.dart';
import '../models/user.dart';

class UserProvider extends InheritedNotifier<ValueNotifier<List<User>>> {
  const UserProvider({super.key, required Widget child, required
    ValueNotifier<List<User>> notifier})
    : super(child: child, notifier: notifier);

  static ValueNotifier<List<User>> of(BuildContext context) {
    return context.
    dependOnInheritedWidgetOfExactType<UserProvider>()!.notifier!;
  }
}