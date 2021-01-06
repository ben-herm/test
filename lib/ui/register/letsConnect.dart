import 'dart:async';

import 'package:Relievion/stores/form/form_store.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/stores/theme/theme_store.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/widgets/progress_indicator_widget.dart';
import 'package:Relievion/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LetsConnectScreen extends StatefulWidget {
  LetsConnectScreen({Key key}) : super(key: key);
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  final Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();
  @override
  _LetsConnectState createState() => _LetsConnectState();
}

class _LetsConnectState extends State<LetsConnectScreen> {
  final _writeController = TextEditingController();
  BluetoothDevice _connectedDevice;
  List<BluetoothService> _services;
  // text controllers
  TextEditingController _digitsController1 = TextEditingController();

  TextEditingController _digitsController2 = TextEditingController();

  TextEditingController _digitsController3 = TextEditingController();

  //focus nodes
  FocusNode _digitsFocusNode1;

  FocusNode _digitsFocusNode2;

  FocusNode _digitsFocusNode3;

  //variables
  Map<String, dynamic> connectObj = {
    "serialNumber": '',
  };

  Map<int, String> serialNumber;

  bool _isLoading = false;

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 24);

  void _setconnectObj(Map<String, dynamic> value) =>
      setState(() => connectObj = value);

  void _setSerialNumber(Map<int, dynamic> value) =>
      setState(() => serialNumber = value);

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    super.initState();
    // flutterBlue.connectedDevices
    //     .asStream()
    //     .listen((List<BluetoothDevice> devices) {
    //   for (BluetoothDevice device in devices) {
    //     print('devices' + device.toString());
    //   }
    // });

    _digitsFocusNode1 = FocusNode();
    _digitsFocusNode2 = FocusNode();
    _digitsFocusNode3 = FocusNode();
    _digitsFocusNode1.addListener(_ondigitsFocusNode1Change);
    _digitsFocusNode2.addListener(_ondigitsFocusNode2Change);
    _digitsFocusNode3.addListener(_ondigitsFocusNode3Change);
    serialNumber = {1: '', 2: '', 3: ''};

    widget.flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        print('connectedBle ' + device.toString());
        widget.flutterBlue.stopScan();
        _addDeviceTolist(device);
      }
    });
    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (result.device.name == 'RLV') {
          print('fuck');
          widget.flutterBlue.stopScan();
          _addDeviceTolist(result.device);
        }
      }
    });
    // widget.flutterBlue.startScan();
  }

  _showDevicecharictaristics(device) async {
    print('ok');
    try {
      await device.connect();
    } catch (e) {
      print('error' + e.toString());
      if (e.code != 'already_connected') {
        setState(() {
          _isLoading = false;
        });
        print('already_connected');
      }
    } finally {
      _services = await device.discoverServices();
      for (BluetoothService service in _services) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          print('uuid ' + characteristic.uuid.toString());
          if (characteristic.uuid.toString().contains('2a25')) {
            var list = await characteristic.read();
            list.forEach((i) {
              print(i);
              print('asiic' + String.fromCharCode(i));
            });
          }

          // print(characteristic.read());
        }
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  _addDeviceTolist(final BluetoothDevice device) {
    if (!widget.devicesList.contains(device)) {
      setState(() {
        widget.devicesList.add(device);
      });
    }
    _showDevicecharictaristics(device);
  }

  void _ondigitsFocusNode1Change() {
    // print("Focus: " + _digitsFocusNode1.hasFocus.toString());
  }

  void _ondigitsFocusNode2Change() {
    // print("Focus: " + _digitsFocusNode2.hasFocus.toString());
  }

  void _ondigitsFocusNode3Change() {
    // print("Focus: " + _digitsFocusNode3.hasFocus.toString());
  }

  _onBackPressed(context) {
    for (BluetoothDevice device in widget.devicesList) {
      device.disconnect();
    }

    // widget.flutterBlue..stopScan();
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
        body: LoadingOverlay(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: _buildBody(context),
          ),
          isLoading: _isLoading,
          color: Colors.grey.shade100,
          // demo of some additional parameters
          opacity: 0.5,
          progressIndicator: CircularProgressIndicator(),
        ));
  }

  void checkDevice(r) async {
    if (r.device.name == 'RLV') {
      print('kaki' + r.device.toString());
    }
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
                    var count = 0;
                    newSerialNumber.forEach((key, val) {
                      if (key == index) {
                        newSerialNumber.update(index, (v) => value.toString());
                      }
                    });
                    newSerialNumber.forEach((key, val) {
                      if (val.length > 0) {
                        count++;
                      }
                    });
                    if (count == 3) {
                      setState(() {
                        _isLoading = true;
                      });
                      widget.flutterBlue
                          .startScan(timeout: Duration(seconds: 4));

                      // for (BluetoothDevice device in widget.devicesList) {
                      //   try {
                      //     await device.connect();
                      //   } catch (e) {
                      //     print('error' + e.toString());
                      //     if (e.code != 'already_connected') {
                      //       setState(() {
                      //         _isLoading = false;
                      //       });
                      //       print('already_connected');
                      //     }
                      //   } finally {
                      //     print('batata');
                      //     _services = await device.discoverServices();
                      //     for (BluetoothService service in _services) {
                      //       for (BluetoothCharacteristic characteristic
                      //           in service.characteristics) {
                      //         // print(characteristic.read().asStream().first);
                      //         var list = await characteristic.read();
                      //         // print("god" + list.toString());
                      //         list.forEach((element) {
                      //           print('aviya hameleh' +
                      //               String.fromCharCode(element));
                      //         });
                      //         // print(characteristic.read());
                      //       }
                      //     }
                      //     setState(() {
                      //       _isLoading = false;
                      //     });
                      //   }
                      // }

                      // Future.delayed(Duration(milliseconds: 4000), () {
                      //   setState(() {
                      //     _isLoading = false;
                      //   });
                      // });
                    }

                    _setSerialNumber(newSerialNumber);
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

  Widget _buildBody(BuildContext context) {
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
                                  fontSize: 18,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: AppLocalizations.of(context)
                                        .translate('last3digits'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(context)
                                        .translate('letsConnectSub2'),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                      fontSize: 18,
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
                        ])),
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

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    // widget.flutterBlue.stopScan();
    super.dispose();
  }
}
