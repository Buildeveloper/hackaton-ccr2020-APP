import 'package:flutter/material.dart';

class KeyboardDismiss extends StatelessWidget {
  final Widget child;

  KeyboardDismiss({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: child);
  }
}
