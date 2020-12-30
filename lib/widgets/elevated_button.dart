import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final store;
  final String type;
  final Function callBack;
  final String text;
  final VoidCallback onPressed;
  bool hasBeenPressed;

  ElevatedButtonWidget(
      {Key key,
      this.store,
      this.type,
      this.onPressed,
      // this.textColor = Colors.white,
      this.callBack,
      this.hasBeenPressed = false,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.width * 0.20,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: hasBeenPressed
                  ? MaterialStateProperty.all<Color>(Colors.grey.shade600)
                  : MaterialStateProperty.all<Color>(Colors.white),
            ),
            child: Text(text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                )),
            onPressed: () async {
              callBack(store, text, type);
            },
          ),
        ));
  }
}
