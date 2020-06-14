import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ace/app/shared/widgets/dialogs.dart';
import 'package:ace/app/shared/constants/strings.dart' as Strings;

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

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialogs(
              widthDialog: 700.0,
              title: Strings.DEFAULT_PROBLEM,
              text: error,
              positiveButtonText: Strings.OK,
            );
          });

      print("ERROR: $obj");
    });

    return request;
  }
}
