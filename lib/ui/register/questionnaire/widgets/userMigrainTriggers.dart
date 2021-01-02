import 'package:Relievion/constants/assets.dart';
import 'package:Relievion/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/services.dart';
import 'package:Relievion/widgets/textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:flutter/rendering.dart';
import 'package:Relievion/widgets/next_button.dart';

class UserMigrainTriggers extends StatefulWidget {
  final store;
  final String type;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function callBack;
  UserMigrainTriggers(
      {Key key,
      this.store,
      this.callBack,
      this.type,
      this.controller,
      this.focusNode})
      : super(key: key);
  @override
  _UserMigrainTriggersState createState() => _UserMigrainTriggersState();
}

class _UserMigrainTriggersState extends State<UserMigrainTriggers> {
  // inputValues:--------------------------------------------------------
  int height;
  void _setHeight(int value) => setState(() => height = value);

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return _buildMain(widget.store);
  }

  Widget getTextWidgets(List<String> strings) {
    return new Row(children: strings.map((item) => new Text(item)).toList());
  }

  Widget renderImages() {
    return Expanded(
      child: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 10.0),
            ],
          )),
    );
  }

  Widget _buildMain(_store) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(AppLocalizations.of(context).translate('migrainTriggerMain'),
            style: titleStyle),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        Text(AppLocalizations.of(context).translate('migrainTriggerSub'),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 15,
            )),
        Column(
          children: [
            Expanded(
              child: new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: 10.0),
                    ],
                  )),
            )
            // SizedBox(height: 20.0),
            // renderImages(),
            // SizedBox(height: 20.0),
            // renderImages(),
            // SizedBox(height: 20.0),
            // renderImages(),
            // SizedBox(height: 20.0),
            // renderImages(),
            // SizedBox(height: 20.0),
            // renderImages(),
            // SizedBox(height: 20.0),
            // renderImages(),
          ],
        ),

        // ListView(
        //   // padding: EdgeInsets.all(4.0),
        //   physics: const BouncingScrollPhysics(
        //       parent: AlwaysScrollableScrollPhysics()),
        //   shrinkWrap: true,
        //   //padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
        //   children: <Widget>[
        //     renderImages(),
        //     SizedBox(height: 20.0),
        //     renderImages(),
        //     SizedBox(height: 20.0),
        //     renderImages(),
        //     SizedBox(height: 20.0),
        //     renderImages(),
        //     SizedBox(height: 20.0),
        //     renderImages(),
        //     SizedBox(height: 20.0),
        //     renderImages(),
        //     SizedBox(height: 20.0),
        //     renderImages(),
        //     SizedBox(height: 20.0),
        //     renderImages(),
        //   ],
        // ),
        SizedBox(height: 20.0),
        NextButtonWidget(
            store: widget.store,
            type: 'userWeight',
            callBack: widget.callBack,
            btnType: "1")
        // _buildNextButton(_store, 'userHeight')
      ],
    );
  }
}
