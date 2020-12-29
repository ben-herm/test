import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FlatButtonWidget extends StatelessWidget {
  final store;
  final String type;
  final Function callBack;
  final String text;

  const FlatButtonWidget(
      {Key key,
      this.store,
      this.type,
      // this.textColor = Colors.white,
      this.callBack,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          height: MediaQuery.of(context).size.width * 0.20,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
