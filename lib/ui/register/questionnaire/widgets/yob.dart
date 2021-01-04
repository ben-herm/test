import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/services.dart';
import 'package:Relievion/widgets/textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:flutter/rendering.dart';
import 'package:Relievion/widgets/next_button.dart';

class Yob extends StatefulWidget {
  final store;
  final Function callBack;
  final TextEditingController controller;
  Yob({Key key, this.store, this.controller, this.callBack}) : super(key: key);
  @override
  _YobState createState() => _YobState();
}

class _YobState extends State<Yob> {
  FocusNode _yobFocusNode;

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(AppLocalizations.of(context).translate('yob'), style: titleStyle),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        Text(AppLocalizations.of(context).translate('yobSub'),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 15,
            )),
        SizedBox(height: 24.0),
        Container(
          width: MediaQuery.of(context).size.width * 0.85,
          // height: MediaQuery.of(context).size.width * 0.20,
          child: Observer(
            builder: (context) {
              return TextFieldWidget(
                hint: AppLocalizations.of(context).translate('User'),
                isObscure: false,
                textAlign: TextAlign.center,
                // icon: Icons.lock,
                // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
                textController: widget.controller,
                focusNode: _yobFocusNode,
                underlineBorder: false,
                errorText: widget.store.formErrorStore.userYob,
                onChanged: (value) {
                  widget.store.setUserYob(int.parse(widget.controller.text));
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4)
                ],
              );
            },
          ),
        ),
        SizedBox(height: 30.0),
        NextButtonWidget(
            store: widget.store,
            type: 'userYob',
            callBack: widget.callBack,
            btnType: "1")
        // _buildNextButton(store, 'userYob')
      ],
    );
  }
}
