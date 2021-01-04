import 'dart:async';

import 'package:Relievion/stores/form/form_store.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/widgets/progress_indicator_widget.dart';
import 'package:Relievion/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:collection';
import 'package:provider/provider.dart';

class LetsConnectScreen extends StatefulWidget {
  ValueNotifier serialNumber = ValueNotifier(false);
  LetsConnectScreen({Key key}) : super(key: key);

  @override
  _LetsConnectState createState() => _LetsConnectState();
}

class _LetsConnectState extends State<LetsConnectScreen> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;

  TextEditingController _digitsController1 = TextEditingController();

  TextEditingController _digitsController2 = TextEditingController();

  TextEditingController _digitsController3 = TextEditingController();

  FocusNode _digitsFocusNode1;

  FocusNode _digitsFocusNode2;

  FocusNode _digitsFocusNode3;

  Map<String, dynamic> connectObj = {
    "serialNumber": '',
  };

  Map<int, dynamic> serialNumber;

  StreamController streamController;
  // foods[foods.indexWhere((element) => element.uid == food.uid)] = food;

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 24);

  void _setconnectObj(Map<String, dynamic> value) =>
      setState(() => connectObj = value);

  void _setSerialNumber(Map<int, dynamic> value) =>
      setState(() => serialNumber = value);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // print('serialNumber' + _setconnectObj.toString());
  }

  @override
  void initState() {
    super.initState();
    _digitsFocusNode1 = FocusNode();
    _digitsFocusNode2 = FocusNode();
    _digitsFocusNode3 = FocusNode();
    _digitsFocusNode1.addListener(_ondigitsFocusNode1Change);
    _digitsFocusNode2.addListener(_ondigitsFocusNode2Change);
    _digitsFocusNode3.addListener(_ondigitsFocusNode3Change);
    serialNumber = {1: '', 2: '', 3: ''};
    // streamController.sink.add(serialNumber);
    print('letsConnect');
    // flutterBlue.connectedDevices
    //     .asStream()
    //     .listen((List<BluetoothDevice> devices) {
    //   for (BluetoothDevice device in devices) {
    //     print('devices' + device.toString());
    //   }
    // });
    // flutterBlue.startScan();
    // flutterBlue.scanResults.listen((List<ScanResult> results) {
    //   for (ScanResult result in results) {
    //     print('lover' + result.toString());
    //   }
    // });
  }

  void checkDeviceConnection() {
    super.didChangeDependencies();
    print('serialNumber' + _setconnectObj.toString());
  }

  void _ondigitsFocusNode1Change() {
    print('bitch' + serialNumber.toString());
    // print("Focus: " + _digitsFocusNode1.hasFocus.toString());
  }

  void _ondigitsFocusNode2Change() {
    // print("Focus: " + _digitsFocusNode2.hasFocus.toString());
  }

  void _ondigitsFocusNode3Change() {
    // print("Focus: " + _digitsFocusNode3.hasFocus.toString());
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25);
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

  Widget buildNumberInputs(int index) {
    var newConnectObj = connectObj;
    var newSerialNumber = serialNumber;
    return new Container(
        width: MediaQuery.of(context).size.width * 0.25,
        alignment: Alignment.centerLeft,
        // height: MediaQuery.of(context).size.width * 0.15,
        child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100),
            child: Observer(
              builder: (context) {
                return TextFieldWidget(
                  // hint: AppLocalizations.of(context).translate('userName'),
                  inputType: TextInputType.name,
                  // icon: Icons.person,
                  focusNode: index == 1
                      ? _digitsFocusNode1
                      : index == 2
                          ? _digitsFocusNode2
                          : _digitsFocusNode3,
                  // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
                  textController: index == 1
                      ? _digitsController1
                      : index == 2
                          ? _digitsController2
                          : _digitsController3,
                  textAlign: TextAlign.center,
                  inputAction: TextInputAction.next,
                  fontSize: 26,
                  autoFocus: false,
                  underlineBorder: true,
                  onChanged: (value) async {
                    newSerialNumber.forEach((key, val) {
                      if (key == index) {
                        newSerialNumber.update(index, (v) => value.toString());
                      }
                    });
                    print('zevel' + newSerialNumber.toString());
                    _setSerialNumber(newSerialNumber);
                    streamController.stream.listen((data) {
                      print("listen value $data");
                    });
                  },
                  onFieldSubmitted: (value) {
                    if (index == 1) {
                      FocusScope.of(context).requestFocus(_digitsFocusNode2);
                    } else if (index == 2) {
                      FocusScope.of(context).requestFocus(_digitsFocusNode3);
                    }
                    //   else {
                    //  FocusScope.of(context).requestFocus(_emailFocusNode);
                    //   }
                  },
                  // errorText:
                  //     _store.formErrorStore.userName,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1)
                  ],
                );
              },
            )));
  }

  Widget _buildBody() {
    final _store = Provider.of<UserStore>(context);
    TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 25);
    TextStyle subTitleStyle = TextStyles.body;
    if (AppTheme.fullWidth(context) < 393) {
      titleStyle = TextStyles.h1Style.copyWith(fontSize: 23);
      subTitleStyle = TextStyles.title.copyWith(fontSize: 18);
    }
    return Material(
        child: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text(
                            AppLocalizations.of(context)
                                .translate('letsConnect'),
                            style: titleStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 24.0),
                          // Padding(padding: EdgeInsets.fromLTRB(25, 0, 25, 0)),
                          Text.rich(
                            TextSpan(
                                text: AppLocalizations.of(context)
                                    .translate('letsConnectSub1'),
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: AppLocalizations.of(context)
                                        .translate('last3digits'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(context)
                                        .translate('letsConnectSub2'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ]),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                buildNumberInputs(1),
                                SizedBox(width: 15),
                                buildNumberInputs(2),
                                SizedBox(width: 15),
                                buildNumberInputs(3),
                              ]),
                          // Text.rich(
                          //   TextSpan(
                          //     style: TextStyle(color: Colors.black),
                          //     children: <InlineSpan>[
                          //       WidgetSpan(
                          //           alignment: PlaceholderAlignment.baseline,
                          //           baseline: TextBaseline.alphabetic,
                          //           child: ConstrainedBox(
                          //             constraints:
                          //                 BoxConstraints(maxWidth: 100),
                          //             child: TextFieldWidget(
                          //               // hint: AppLocalizations.of(context).translate('userName'),
                          //               inputType: TextInputType.name,
                          //               // icon: Icons.person,
                          //               // iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
                          //               // textController: _userNameController,
                          //               inputAction: TextInputAction.next,
                          //               autoFocus: false,
                          //               underlineBorder: true,
                          //               onChanged: (value) {
                          //                 // _store.setUserName(
                          //                 //     _userNameController.text);
                          //               },
                          //               onFieldSubmitted: (value) {
                          //                 // FocusScope.of(context)
                          //                 //     .requestFocus(_emailFocusNode);
                          //               },
                          //               errorText:
                          //                   _store.formErrorStore.userName,
                          //               inputFormatters: [
                          //                 LengthLimitingTextInputFormatter(9),
                          //                 FilteringTextInputFormatter(
                          //                     RegExp('[a-zA-Z0-9]'),
                          //                     allow: true)
                          //               ],
                          //             ),
                          //           )),
                          //       TextSpan(
                          //         text: '.',
                          //       ),
                          //     ],
                          //   ),
                          // )
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
                        ])
                        // StreamBuilder<BluetoothState>(
                        //     stream: FlutterBlue.instance.state,
                        //     initialData: BluetoothState.unknown,
                        //     builder: (c, snapshot) {
                        //       final state = snapshot.data;
                        //       return
                        //       // if (state == BluetoothState.on) {
                        //       //   return FindDevicesScreen();
                        //       // }
                        //       // return BluetoothOffScreen(state: state);
                        //     }),
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
}
