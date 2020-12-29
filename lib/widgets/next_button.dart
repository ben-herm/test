import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/rendering.dart';

class NextButtonWidget extends StatelessWidget {
  final store;
  final String type;
  final Function callBack;
  final VoidCallback onPressed;

  const NextButtonWidget(
      {Key key,
      this.store,
      this.type,
      // this.textColor = Colors.white,
      this.callBack,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 130),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          height: MediaQuery.of(context).size.width * 0.10,
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
              callBack(store, type);
            },
          ),
        ));
  }
}
