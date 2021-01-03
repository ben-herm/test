import 'package:flutter/cupertino.dart';
import 'package:flutter_blue/flutter_blue.dart';

class LetsConnectScreen extends StatefulWidget {
  LetsConnectScreen({Key key}) : super(key: key);

  @override
  _LetsConnectState createState() => _LetsConnectState();
}

class _LetsConnectState extends State<LetsConnectScreen> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;

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
    flutterBlue.startScan();
    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        print('lover' + result.toString());
      }
    });
  }

//   _addDeviceTolist(final BluetoothDevice device) {
//    if (!widget.devicesList.contains(device)) {
//      setState(() {
//        widget.devicesList.add(device);
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            // if (state == BluetoothState.on) {
            //   return FindDevicesScreen();
            // }
            // return BluetoothOffScreen(state: state);
          }),
    );
  }
}
