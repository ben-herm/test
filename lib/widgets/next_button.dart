import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/rendering.dart';

class NextButtonWidget extends StatelessWidget {
  final store;
  final String type;
  final value;
  final String btnType;
  final bool checkError;
  final Function callBack;
  final VoidCallback onPressed;

  const NextButtonWidget(
      {Key key,
      this.store,
      this.type,
      this.checkError = false,
      this.btnType,
      this.value,
      // this.textColor = Colors.white,
      this.callBack,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _showErrorMessage(String message) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message != null && message.isNotEmpty) {
          FlushbarHelper.createError(
            message: message,
            title: AppLocalizations.of(context).translate('home_tv_error'),
            duration: Duration(seconds: 3),
          )..show(context);
        }
      });

      return SizedBox.shrink();
    }

    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.width * 0.12,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey.shade800),
            ),
            child: Text(AppLocalizations.of(context).translate('nextBtn'),
                style: TextStyle(
                  fontSize: 18,
                )),
            onPressed: () async {
              // onPressed();
              // if (checkError) {
              //   _showErrorMessage('Please choose ');
              //   return;
              // }
              if (btnType == "1") {
                callBack(store, type);
              } else {
                callBack(store, type, value);
              }
            },
          ),
        ));
  }
}
