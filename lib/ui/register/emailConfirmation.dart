import 'package:Relievion/data/sharedpref/constants/preferences.dart';
import 'package:Relievion/routes.dart';
import 'package:Relievion/stores/form/form_store.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/widgets/empty_app_bar_widget.dart';
import 'package:Relievion/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:Relievion/routes.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/data/sharedpref/constants/preferences.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/rendering.dart';

class EmailConfirmation extends StatefulWidget {
  @override
  _EmailConfirmationState createState() => _EmailConfirmationState();
}

class _EmailConfirmationState extends State<EmailConfirmation> {
  //stores:---------------------------------------------------------------------
  ThemeStore _themeStore;

  //stores:---------------------------------------------------------------------
  final _store = FormStore();

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
      appBar: EmptyAppBar(),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
        child: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    // Expanded(
                    //   flex: 1,
                    //   child: _buildLeftSide(),
                    // ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        _buildRightSide(),
                        Observer(
                          builder: (context) {
                            return _store.success
                                ? navigate(context)
                                : _showErrorMessage(
                                    _store.errorStore.errorMessage);
                          },
                        ),
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
    TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 25);
    TextStyle subTitleStyle = TextStyles.title.copyWith(fontSize: 20);
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.h1Style.copyWith(fontSize: 23);
      subTitleStyle = TextStyles.title.copyWith(fontSize: 18);
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: [
              Text(
                AppLocalizations.of(context).translate('createAccountTitle'),
                style: titleStyle,
              ),
              SizedBox(height: 24.0),
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
