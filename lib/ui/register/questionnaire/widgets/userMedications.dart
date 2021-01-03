import 'package:Relievion/widgets/flat_button.dart';
import 'package:Relievion/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:flutter/rendering.dart';

class UserMedications extends StatefulWidget {
  final store;
  final Function callBack;
  UserMedications({Key key, this.store, this.callBack}) : super(key: key);
  @override
  _UserMedicationsState createState() => _UserMedicationsState();
}

class _UserMedicationsState extends State<UserMedications> {
  Map<String, Map> medications = {
    "group1": {
      "isSet": false,
      "meds": ["Advil", "Motrin"]
    },
    "group2": {
      "isSet": false,
      "meds": ["Aleve", "Anaprox", "Naprosyn"]
    },
    "group3": {
      "isSet": false,
      "meds": ["Excedrin" "Migraine", "Excedrin"]
    },
    "group4": {
      "isSet": false,
      "meds": ["DHE-45", "injection", "Ergomar"]
    },
    "group5": {
      "isSet": false,
      "meds": ["Zomig"]
    },
  };

  // foods[foods.indexWhere((element) => element.uid == food.uid)] = food;

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 24);

  void _setMedications(Map<String, Map> value) =>
      setState(() => medications = value);

  @override
  void initState() {
    super.initState();
    widget.store.setUsermedications(null);
  }

  bool _checkIfMedicationsExist() {
    var doesExist = false;
    medications.forEach((key, value) {
      if (value["isSet"] == true) {
        doesExist = true;
      }
    });
    return doesExist;
  }

  @override
  Widget build(BuildContext context) {
    var newMedications = medications;
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('medications'),
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          FlatButtonWidget(
              store: widget.store,
              backGroundPressedColor: newMedications["group1"]["isSet"],
              maxlines: 2,
              onPressed: () {
                newMedications.forEach((key, value) {
                  if (key == "group1") {
                    value.update("isSet", (value) => !value);
                  }
                });
                _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Advil, Motrin)'),
          FlatButtonWidget(
              store: widget.store,
              backGroundPressedColor: newMedications["group2"]["isSet"],
              maxlines: 2,
              onPressed: () {
                newMedications.forEach((key, value) {
                  if (key == "group2") {
                    value.update("isSet", (value) => !value);
                  }
                });
                _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Aleve, Anaprox, Naprosyn)'),
          FlatButtonWidget(
              store: widget.store,
              maxlines: 2,
              backGroundPressedColor: newMedications["group3"]["isSet"],
              onPressed: () {
                newMedications.forEach((key, value) {
                  if (key == "group3") {
                    value.update("isSet", (value) => !value);
                  }
                });
                _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Excedrin Migraine, Excedrin)'),
          FlatButtonWidget(
              store: widget.store,
              backGroundPressedColor: newMedications["group4"]["isSet"],
              maxlines: 2,
              onPressed: () {
                newMedications.forEach((key, value) {
                  if (key == "group4") {
                    value.update("isSet", (value) => !value);
                  }
                });
                _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(DHE-45 injection, Ergomar)'),
          FlatButtonWidget(
              store: widget.store,
              maxlines: 2,
              backGroundPressedColor: newMedications["group5"]["isSet"],
              onPressed: () {
                newMedications.forEach((key, value) {
                  if (key == "group5") {
                    value.update("isSet", (value) => !value);
                  }
                });
                _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Zomig)'),
          new NextButtonWidget(
            store: widget.store,
            type: 'userMedications',
            checkError: _checkIfMedicationsExist() ? false : true,
            callBack: widget.callBack,
            value: medications,
            btnType: "2",
          ),
        ],
      ),
    );
  }
}
