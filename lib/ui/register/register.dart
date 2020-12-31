import 'package:Relievion/routes.dart';
import 'package:Relievion/stores/form/form_store.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/utils/device/device_utils.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/widgets/progress_indicator_widget.dart';
import 'package:Relievion/widgets/textfield_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //checkBox controller:--------------------------------------------------------
  bool _value1 = false;
  void _value1Changed(bool value) => setState(() => _value1 = value);
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  //stores:---------------------------------------------------------------------
  ThemeStore _themeStore;
  // FormStore _store;

  //focus node:-----------------------------------------------------------------
  FocusNode _passwordFocusNode;

  FocusNode _emailFocusNode;

  FocusNode _nameFocusNode;

  //stores:---------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    _passwordFocusNode.addListener(_onPasswordFocusChange);
    _emailFocusNode.addListener(_onEmailFocusChange);
    _nameFocusNode.addListener(_onNameFocusChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeStore = Provider.of<ThemeStore>(context);
  }

  void _onPasswordFocusChange() {
    print("Focus: " + _passwordFocusNode.hasFocus.toString());
  }

  void _onEmailFocusChange() {
    print("Focus: " + _emailFocusNode.hasFocus.toString());
  }

  void _onNameFocusChange() {
    print("Focus: " + _nameFocusNode.hasFocus.toString());
  }

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<UserStore>(context);
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
      body: _buildBody(_store),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody(_store) {
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
                      child: _buildRightSide(_store),
                    ),
                  ],
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        _buildRightSide(_store),
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

  // Widget _buildLeftSide() {
  //   return SizedBox.expand(
  //     child: Image.asset(
  //       Assets.carBackground,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }

  Widget _buildRightSide(_store) {
    TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 23);
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
            KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
              return (!isKeyboardVisible ||
                      _nameFocusNode.hasFocus ||
                      _emailFocusNode.hasFocus ||
                      !_passwordFocusNode.hasFocus)
                  ? Column(children: [
                      Text(
                        AppLocalizations.of(context)
                            .translate('createAccountTitle'),
                        style: titleStyle,
                      ),
                      SizedBox(height: 24.0),
                    ])
                  : SizedBox(height: 1);
            }),
            // AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            _buildUserNameField(_store),
            _buildUserEmailField(_store),
            _buildPasswordField(_store),
            // _buildForgotPasswordButton(),
            privacyPolicyLinkAndTermsOfService(),
            SizedBox(height: 20.0),
            _buildNextButton(_store)
          ],
        ),
      ),
    );
  }

  Widget _buildUserNameField(_store) {
    return Column(
      children: <Widget>[
        Align(
            alignment: FractionalOffset.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                AppLocalizations.of(context).translate('userName'),
                style: TextStyle(fontSize: 20),
              ),
            )),
        Observer(
          builder: (context) {
            return TextFieldWidget(
              // hint: AppLocalizations.of(context).translate('userName'),
              inputType: TextInputType.name,
              // icon: Icons.person,
              // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
              textController: _userNameController,
              inputAction: TextInputAction.next,
              autoFocus: false,
              onChanged: (value) {
                _store.setUserName(_userNameController.text);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              errorText: _store.formErrorStore.userName,
              inputFormatters: [
                LengthLimitingTextInputFormatter(9),
                FilteringTextInputFormatter(RegExp('[a-zA-Z0-9]'), allow: true)
              ],
            );
          },
        )
      ],
    );
  }

  Widget privacyPolicyLinkAndTermsOfService() {
    return Container(
      // alignment: Alignment.bottomLeft,
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: CheckboxListTile(
        value: _value1,
        onChanged: _value1Changed,
        contentPadding: EdgeInsets.all(0),
        title: Text.rich(TextSpan(
            text: AppLocalizations.of(context).translate('policyAgreement1') +
                ' ',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            children: <TextSpan>[
              TextSpan(
                  text: AppLocalizations.of(context)
                      .translate('policyAgreement2'),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // code to open / launch terms of service link here
                    }),
              TextSpan(
                  text: ' and ',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(
                        text: AppLocalizations.of(context)
                            .translate('policyAgreement3'),
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // code to open / launch privacy policy link here
                          })
                  ])
            ])),
        controlAffinity: ListTileControlAffinity.leading,
        // secondary: Icon(Icons.archive),
        activeColor: Colors.black,
      ),
    );
  }

  Widget _buildUserEmailField(_store) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
        Align(
            alignment: FractionalOffset.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                AppLocalizations.of(context).translate('userEmail'),
                style: TextStyle(fontSize: 20),
              ),
            )),
        Observer(
          builder: (context) {
            return TextFieldWidget(
              // hint: AppLocalizations.of(context).translate('userName'),
              inputType: TextInputType.emailAddress,
              // icon: Icons.person,
              // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
              textController: _userEmailController,
              inputAction: TextInputAction.next,
              focusNode: _emailFocusNode,
              autoFocus: false,
              onChanged: (value) {
                _store.setUserId(_userEmailController.text);
              },
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              errorText: _store.formErrorStore.userEmail,
            );
          },
        )
      ],
    );
  }

  Widget _buildPasswordField(_store) {
    return Column(
      children: <Widget>[
        KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
          return !isKeyboardVisible
              ? Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0))
              : Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0));
        }),
        Align(
            alignment: FractionalOffset.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                AppLocalizations.of(context).translate('userPassword'),
                style: TextStyle(fontSize: 20),
              ),
            )),
        Observer(
          builder: (context) {
            return TextFieldWidget(
              hint: AppLocalizations.of(context).translate('User'),
              isObscure: true,

              // icon: Icons.lock,
              // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
              textController: _passwordController,
              focusNode: _passwordFocusNode,
              errorText: _store.formErrorStore.password,
              onChanged: (value) {
                _store.setPassword(_passwordController.text);
              },
            );
          },
        )
      ],
    );
  }

  // Widget _buildForgotPasswordButton() {
  //   return Align(
  //     alignment: FractionalOffset.centerRight,
  //     child: FlatButton(
  //       padding: EdgeInsets.all(0.0),
  //       child: Text(
  //         AppLocalizations.of(context).translate('login_btn_forgot_password'),
  //         style: Theme.of(context)
  //             .textTheme
  //             .caption
  //             .copyWith(color: Colors.orangeAccent),
  //       ),
  //       onPressed: () {},
  //     ),
  //   );
  // }

  Widget _buildNextButton(_store) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 130),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          height: MediaQuery.of(context).size.height * 0.05,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey.shade800),
            ),
            child: Text(AppLocalizations.of(context).translate('nextBtn'),
                style: TextStyle(
                  fontSize: 18,
                )),
            onPressed: () async {
              if (_store.canRegister) {
                DeviceUtils.hideKeyboard(context);
                // await _store.register();
                Navigator.of(context).pushNamed(Routes.emailConfirmation);
                // Navigator.of(context).pushNamed(Routes.register);
              } else {
                _showErrorMessage('Please fill in all fields');
              }
            },
          ),
        ));
  }

  Widget navigate(BuildContext context) {
    //sets if logged in
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.setBool(Preferences.is_logged_in, true);
    // });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamed(Routes.emailConfirmation);
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
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
