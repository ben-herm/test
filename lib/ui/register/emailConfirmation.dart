import 'package:Relievion/data/sharedpref/constants/preferences.dart';
import 'package:Relievion/routes.dart';
import 'package:Relievion/stores/form/form_store.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:flutter/rendering.dart';

import '../../stores/form/form_store.dart';

class EmailConfirmation extends StatefulWidget {
  @override
  _EmailConfirmationState createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  //stores:---------------------------------------------------------------------
  ThemeStore _themeStore;

  //stores:---------------------------------------------------------------------
  // FormStore _store;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text("Sample"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    final _store = Provider.of<UserStore>(context);
    return Material(
        child: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: SafeArea(
                child: Column(
                  children: [
                    _buildRightSide(),
                    // Observer(
                    //   builder: (context) {
                    //     return _store.success
                    //         ? navigate(context)
                    //         : _showErrorMessage(
                    //             _store.errorStore.errorMessage);
                    //   },
                    // ),
                    Observer(
                      builder: (context) {
                        return Visibility(
                          visible: _store.loading,
                          child: CustomProgressIndicatorWidget(),
                        );
                      },
                    )
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  Widget _buildRightSide() {
    final store = Provider.of<UserStore>(context);
    TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 25);
    TextStyle subTitleStyle = TextStyles.body;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.h1Style.copyWith(fontSize: 23);
      subTitleStyle = TextStyles.title.copyWith(fontSize: 18);
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: [
              Text(
                AppLocalizations.of(context).translate('confirmAccount'),
                style: titleStyle,
              ),
              SizedBox(height: 24.0),
              Padding(padding: EdgeInsets.fromLTRB(25, 0, 25, 0)),

              Text.rich(
                TextSpan(
                    text: AppLocalizations.of(context)
                        .translate('confirmEmailTxt1'),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: store.userEmail,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )
                    ]),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  AppLocalizations.of(context).translate('confirmEmailTxt2'),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    // decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 1), width: 1.0))),
                  child: RichText(
                    text: TextSpan(
                        text: AppLocalizations.of(context)
                            .translate('resendEmail'),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          // decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pushNamed(Routes.questionnaire);
                          }),
                  ))

              // Text(
              //   AppLocalizations.of(context).translate('confirmEmailTxt1'),
              //   textAlign: TextAlign.center,
              //   style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              // ),
              // SizedBox(height: 24.0),
              // Text(
              //   AppLocalizations.of(context).translate('confirmEmailTxt2'),
              //   style: subTitleStyle,
              // )
            ]),
            // AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Preferences.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home, (Route<dynamic> route) => false);
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
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

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    super.dispose();
  }
}
