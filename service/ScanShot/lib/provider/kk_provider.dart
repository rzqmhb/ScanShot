import 'package:flutter/material.dart';
import 'package:scanshot/models/kartu_keluarga.dart';

class KKProvider extends InheritedNotifier<ValueNotifier<List<KartuKeluarga>>> {
  const KKProvider(
      {super.key,
      required Widget child,
      required ValueNotifier<List<KartuKeluarga>> notifier})
      : super(child: child, notifier: notifier);

  static ValueNotifier<List<KartuKeluarga>> of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<KKProvider>()!.notifier!;
  }
}
