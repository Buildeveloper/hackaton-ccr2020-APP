import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Ace',
      theme: ThemeData(
        canvasColor: AppColors.CANVAS_COLOR,
        primaryColor: AppColors.PRIMARY_COLOR,
        accentColor: AppColors.ACCENT_COLOR,
        cursorColor: AppColors.ACCENT_COLOR,
        unselectedWidgetColor: AppColors.ACCENT_COLOR,
        textTheme: TextTheme(
            body1: TextStyle(color: AppColors.PRIMARY_COLOR),
            display1: TextStyle(color: AppColors.PRIMARY_COLOR)),
      ),
      initialRoute: Modular.initialRoute,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
