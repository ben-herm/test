import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FlatButtonWidget extends StatelessWidget {
  final store;
  final String type;
  final Function callBack;
  final String text;
  final int maxlines;
  final VoidCallback onPressed;
  bool hasBeenPressed;

  FlatButtonWidget(
      {Key key,
      this.store,
      this.type,
      this.onPressed,
      // this.textColor = Colors.white,
      this.callBack,
      this.maxlines,
      this.hasBeenPressed = false,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.07,
            child: FlatButton(
              color: Colors.white,
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.black, width: 0.2)),
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              // padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                /*...*/
              },
              child: Text(
                text,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal),
                maxLines: maxlines,
              ),
            )

            // ElevatedButton(
            //   style: ButtonStyle(
            //     backgroundColor: hasBeenPressed
            //         ? MaterialStateProperty.all<Color>(Colors.grey.shade600)
            //         : MaterialStateProperty.all<Color>(Colors.white),
            //   ),
            //   child: Text(text,
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 18,
            //       )),
            //   onPressed: () async {
            //     callBack(store, text, type);
            //   },
            // ),
            ));
  }
}
