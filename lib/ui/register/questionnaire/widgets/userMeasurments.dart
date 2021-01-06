import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/services.dart';
import 'package:Relievion/widgets/textfield_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:flutter/rendering.dart';
import 'package:Relievion/widgets/next_button.dart';

class UserMeasurments extends StatefulWidget {
  final store;
  final String type;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function callBack;
  UserMeasurments(
      {Key key,
      this.store,
      this.callBack,
      this.type,
      this.controller,
      this.focusNode})
      : super(key: key);
  @override
  _UserMeasurmentsState createState() => _UserMeasurmentsState();
}

class _UserMeasurmentsState extends State<UserMeasurments> {
  // inputValues:--------------------------------------------------------
  int height;
  void _setHeight(int value) => setState(() => height = value);

  int weight;
  void _setWeight(int value) => setState(() => weight = value);

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 20);
  TextStyle subTitleStyle = TextStyles.title.copyWith(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    if (widget.type == 'userHeight') {
      return _buildHeightField(widget.store);
    }
    return _buildWeightField(widget.store);
  }

  Widget _buildHeightField(_store) {
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.h1Style.copyWith(fontSize: 18);
      subTitleStyle = TextStyles.title.copyWith(fontSize: 16);
    }
    return Column(
      children: <Widget>[
        Text(AppLocalizations.of(context).translate('userHeight'),
            style: titleStyle),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        Text(
          AppLocalizations.of(context).translate('weightHeightSub'),
          style: subTitleStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            // height: MediaQuery.of(context).size.width * 0.15,
            child: Observer(
              builder: (context) {
                return TextFieldWidget(
                  hint: AppLocalizations.of(context).translate('User'),
                  isObscure: false,
                  textAlign: TextAlign.center,
                  // icon: Icons.lock,
                  // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
                  textController: widget.controller,
                  underlineBorder: false,
                  focusNode: widget.focusNode,
                  errorText: _store.formErrorStore.userHeight,
                  onChanged: (value) {
                    widget.store
                        .setUserHeight(int.parse(widget.controller.text));
                  },
                  // onChanged: (value) {
                  //   _setHeight(value);
                  // },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                    // FilteringTextInputFormatter(RegExp(r'(^\d*\.?\d*)'),
                    //     allow: true)
                  ],
                );
              },
            ),
          ),
          SizedBox(width: 5.0),
          Text('cm',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ))
        ]),
        SizedBox(height: 30.0),
        NextButtonWidget(
            store: widget.store,
            type: 'userHeight',
            callBack: widget.callBack,
            btnType: "1")
        // _buildNextButton(_store, 'userHeight')
      ],
    );
  }

  Widget _buildWeightField(_store) {
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.h1Style.copyWith(fontSize: 18);
      subTitleStyle = TextStyles.title.copyWith(fontSize: 16);
    }
    return Column(
      children: <Widget>[
        Text(AppLocalizations.of(context).translate('userWeight'),
            style: titleStyle),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        Text(
          AppLocalizations.of(context).translate('weightHeightSub'),
          style: subTitleStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Observer(
              builder: (context) {
                return TextFieldWidget(
                  hint: AppLocalizations.of(context).translate('User'),
                  isObscure: false,
                  textAlign: TextAlign.center,
                  // icon: Icons.lock,
                  // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
                  textController: widget.controller,
                  focusNode: widget.focusNode,
                  underlineBorder: false,
                  errorText: _store.formErrorStore.userWeight,
                  onChanged: (value) {
                    widget.store
                        .setUserWeight(double.parse(widget.controller.text));
                  },
                  // onChanged: (value) {
                  //   _setWeight(value);
                  // },
                  inputFormatters: <TextInputFormatter>[
                    // FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                    FilteringTextInputFormatter(RegExp(r'(^\d*\.?\d*)'),
                        allow: true)
                  ],
                );
              },
            ),
          ),
          SizedBox(width: 5.0),
          Text('kg',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ))
        ]),
        SizedBox(height: 30.0),
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
