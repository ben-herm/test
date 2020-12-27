import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/routes.dart';
import 'package:Relievion/stores/theme/light_color.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/stores/theme/extention.dart';
import 'package:Relievion/data/sharedpref/constants/preferences.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

enum _Platform { android, ios }

class Onboarding extends StatefulWidget {
  Onboarding({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  ThemeStore _themeStore;

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => Routes.login)),

    return Container();
  }

  Widget _checkList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
        ),
        Icon(
          Icons.check_circle_outline_sharp,
          color: Colors.black,
          size: 30.0,
          semanticLabel: 'Text to announce in accessibility modes',
        ),
        Text(
          AppLocalizations.of(context).translate('welcomeCheckList1'),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 15),
        Icon(
          Icons.check_circle_outline_sharp,
          color: Colors.black,
          size: 30.0,
        ),
        Text(
          AppLocalizations.of(context).translate('welcomeCheckList2'),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 15),
        Icon(
          Icons.check_circle_outline_sharp,
          color: Colors.black,
          size: 30.0,
        ),
        Text(
          AppLocalizations.of(context).translate('welcomeCheckList3'),
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _welcomeTo(titleStyle, subTitleStyle) {
    TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = TextStyle(color: Colors.black);
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SafeArea(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Image.asset('assets/images/logo.png',
                      fit: BoxFit.contain)),
            ),
            Text(
              AppLocalizations.of(context).translate('welcome'),
              style: titleStyle,
            ),
            SizedBox(width: 10, height: 3),
            Text(
              AppLocalizations.of(context).translate('welcomeSub'),
              style: subTitleStyle,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.width * 0.175,
              child: ElevatedButton(
                // style: TextStyle(fontSize: 14),
                child: Text(AppLocalizations.of(context).translate('signUp'),
                    style: TextStyle(fontSize: 18)),
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.register);
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 1), width: 1.0))),
                child: RichText(
                  text: TextSpan(
                      text: AppLocalizations.of(context).translate('signIn'),
                      style: linkStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushNamed(Routes.login);
                        }),
                ))
          ],
        )
      ],
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      LightColor.orange,
      LightColor.green,
      LightColor.grey,
      LightColor.lightOrange,
      LightColor.skyBlue,
      LightColor.titleTextColor,
      Colors.red,
      Colors.brown,
      LightColor.purpleExtraLight,
      LightColor.skyBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25);
    TextStyle subTitleStyle = TextStyles.title.copyWith(fontSize: 20);
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.title.copyWith(fontSize: 23);
      subTitleStyle = TextStyles.title.copyWith(fontSize: 18);
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [_welcomeTo(titleStyle, subTitleStyle), _checkList()],
            ),
          ),
        ],
      ),
    );
  }

  // Column(
  //   crossAxisAlignment: CrossAxisAlignment.center,
  //   children: <Widget>[
  //     _welcomeTo(titleStyle, subTitleStyle),
  //     _checkList()
  //   ],
  // )
}
