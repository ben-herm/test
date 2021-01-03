import 'package:Relievion/data/sharedpref/constants/preferences.dart';
import 'package:Relievion/routes.dart';
import 'package:Relievion/stores/form/form_store.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/ui/register/questionnaire/widgets/userHeadacheDays.dart';
import 'package:Relievion/ui/register/questionnaire/widgets/userMeasurments.dart';
import 'package:Relievion/ui/register/questionnaire/widgets/userMedications.dart';
import 'package:Relievion/ui/register/questionnaire/widgets/userMigrainTriggers.dart';
import 'package:Relievion/ui/register/questionnaire/widgets/userSex.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/utils/device/device_utils.dart';
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
import 'package:Relievion/ui/register/questionnaire/widgets/yob.dart';

import '../../../stores/form/form_store.dart';

class QuestionnaireScreen extends StatefulWidget {
  @override
  _QuestionnaireScreenState createState() => _QuestionnaireScreenState();
}

class _QuestionnaireScreenState extends State<QuestionnaireScreen> {
  // inputValues:--------------------------------------------------------

  //steps controller:--------------------------------------------------------
  int _step = 0;
  void _increaseStep(int value) => setState(() => _step = _step + value);
  void _decreaseStep(int value) =>
      setState(() => _step != 0 ? _step = _step - value : _step);
  //stores:---------------------------------------------------------------------
  ThemeStore _themeStore;
  TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 12);

  // FormStore _store;

  //text controllers:-----------------------------------------------------------

  FocusNode _heightFocusNode;
  FocusNode _weightFocusNode;
  TextEditingController _userHeightController = TextEditingController();
  TextEditingController _userWeightController = TextEditingController();
  TextEditingController _userYobController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  _onBackPressed(context) {
    if (_step == 0) {
      Navigator.of(context).pop(true);
    } else if (_step == 6) {
      // _store.setUsermedications(null);
      _decreaseStep(1);
    } else {
      _decreaseStep(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<UserStore>(context);
    return new WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Scaffold(
          primary: true,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            // title: Text(_step.toString()),

            // centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: _buildBody(_store),
        ));
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody(_store) {
    final _store = Provider.of<UserStore>(context);
    return Material(
        child: Container(
      child: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SafeArea(
                child: Column(
                  children: [
                    _buildRightSide(_store),
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

  void setActionByType(store, value, type) async {
    switch (type) {
      case 'userSex':
        store.setUserSex(value);
        _increaseStep(1);
        break;
      case 'userHeadacheDays':
        store.setUserHeadacheDays(value);
        _increaseStep(1);
        break;
    }
  }

  void setNextActionByType(store, type, [Map value]) async {
    DeviceUtils.hideKeyboard(context);
    switch (type) {
      case 'userYob':
        int yob;
        if (_userYobController.text.isNotEmpty) {
          yob = int.parse(_userYobController.text);
        } else {
          yob = 0;
        }
        if (store.isYobSet && yob > 0) {
          _increaseStep(1);
        } else {
          _showErrorMessage('Please fill in all fields');
        }
        break;
      case 'userHeight':
        var test = int.parse(_userHeightController.text);
        await store.setUserHeight(test);
        if (store.isHeightSet) {
          _increaseStep(1);
        } else {
          _showErrorMessage('Please fill in your height');
        }
        break;
      case 'userWeight':
        var test = double.parse(_userWeightController.text);
        await store.setUserWeight(test);
        if (store.isWeightSet) {
          _increaseStep(1);
        } else {
          _showErrorMessage('Please fill in your height');
        }
        break;
      case 'userMedications':
        await store.setUsermedications(value);
        if (store.isMedicationsSet) {
          _increaseStep(1);
        }
        break;
    }
  }

  Widget buildMain(_store) {
    switch (_step) {
      case 0:
        return Yob(
          store: _store,
          callBack: setNextActionByType,
          controller: _userYobController,
        );
        // return _buildYobField(_store);
        break;
      case 1:
        return UserSex(store: _store, callBack: setActionByType);
        // return _buildSexField(_store);
        break;
      case 2:
        return UserMeasurments(
          store: _store,
          callBack: setNextActionByType,
          controller: _userHeightController,
          focusNode: _heightFocusNode,
          type: 'userHeight',
        );
        break;
      case 3:
        return UserMeasurments(
          store: _store,
          callBack: setNextActionByType,
          controller: _userWeightController,
          focusNode: _weightFocusNode,
          type: 'weight',
        );
        break;
      case 4:
        return UserHeadacheDays(
          store: _store,
          callBack: setActionByType,
        );
      //   errorDescription =
      //       "Received invalid status code: ${error.response.statusCode}";
      //   break;
      case 5:
        return UserMedications(store: _store, callBack: setNextActionByType);
        break;
      case 6:
        return UserMigrainTriggers(
            store: _store, callBack: setNextActionByType);
        break;

      default:
        return Visibility(
          visible: _store.loading,
          child: CustomProgressIndicatorWidget(),
        );
    }
  }

  Widget _buildHeader(_store) {
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.h1Style.copyWith(fontSize: 24);
    }
    return Container(
      child: Column(children: [
        Text.rich(
          TextSpan(
            text: _store.userName + ', ',
            style: titleStyle,
            children: <TextSpan>[
              TextSpan(
                text: AppLocalizations.of(context).translate('getToKnow'),
                style: titleStyle,
              )
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        Text(
          AppLocalizations.of(context).translate('getToKnowSub'),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 60.0),
      ]),
    );
  }

  Widget _buildRightSide(_store) {
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.h1Style.copyWith(fontSize: 23);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_step < 4) _buildHeader(_store),
          buildMain(_store),
          // SizedBox(height: 20.0),
        ],
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
