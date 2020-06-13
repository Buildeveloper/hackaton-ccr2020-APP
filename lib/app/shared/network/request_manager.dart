import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ace/app/shared/widgets/dialogs.dart';
import 'package:ace/app/shared/constants/strings.dart' as Strings;
import 'package:ace/app/shared/constants/routes.dart' as Routes;

class RequestManager {
  static Future<T> loadingRequest<T>(
      BuildContext context, Future<T> request) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Container(
              child: SpinKitChasingDots(
                size: 75.0,
                color: Theme.of(context).primaryColor,
                duration: Duration(milliseconds: 1500),
              ),
              color: Colors.transparent,
            ),
          );
        });

    request.whenComplete(() {
      Navigator.of(context, rootNavigator: true).pop();
    }).catchError((Object obj) {
      String error = Strings.UNKNOWN_ERROR;
      bool activeUser = true;

      switch (obj.runtimeType) {
        case DioError:
          final dioError = obj as DioError;

          if (dioError.error != null)
            if (dioError.error is String)
              error = dioError.error;
//
//          if (error.startsWith(Strings.INACTIVE_USER_EXCEPTION))
//            activeUser = false;

          final res = dioError.response;
          if (res != null) {
            if (res.statusCode == 401) error = Strings.INVALID_CREDENTIALS;
          }

          break;
        default:
      }

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialogs(
              widthDialog: 700.0,
              title: Strings.DEFAULT_PROBLEM,
              text: error,
              positiveButtonText: Strings.OK,
              positiveButtonCallPop: activeUser,
              positiveButtonOnPressed: () {
                if (!activeUser) {
                  Modular.to.pop();
                  Modular.to.pushReplacementNamed(Routes.LOGIN);
                }
              },
            );
          });

      print("ERROR: $obj");
    });

    return request;
  }
}
