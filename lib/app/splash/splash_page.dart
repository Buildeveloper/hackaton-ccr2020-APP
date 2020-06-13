import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobx/mobx.dart';
import 'package:ace/app/shared/auth/auth_controller.dart';
import 'package:ace/app/shared/constants/routes.dart' as Routes;
import 'package:ace/app/shared/constants/resources.dart' as Resources;
import 'package:ace/app/shared/constants/colors.dart' as AppColors;

class SplashPage extends StatefulWidget {
  final String title;

  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      final auth = Modular.get<AuthController>();
      auth.isUserLogged().then((logged) => _checkUserLogged(logged));
    }, delay: 5000);
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  _checkUserLogged(bool logged) {
    if (logged) {
      Modular.to.pushReplacementNamed(Routes.HOME);
    } else {
      Modular.to.pushReplacementNamed(Routes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              color: AppColors.ACCENT_COLOR,
              height: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage(Resources.LOGO),
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SpinKitChasingDots(
              size: 75.0,
              color: AppColors.ACCENT_COLOR,
              duration: Duration(milliseconds: 1500),
            ),
          ),
        ],
      ),
    );
  }
}
