import 'package:Relievion/models/medications/medications.dart';
import 'package:Relievion/widgets/flat_button.dart';
import 'package:Relievion/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/widgets/elevated_button.dart';
import 'package:flutter/rendering.dart';
import 'package:Relievion/models/medications/medications.dart';

class UserMedications extends StatefulWidget {
  final store;
  final Function callBack;
  UserMedications({Key key, this.store, this.callBack}) : super(key: key);
  @override
  _UserMedicationsState createState() => _UserMedicationsState();
}

class _UserMedicationsState extends State<UserMedications> {
  Map<List, bool> medications = {
    ["Advil", "Motrin"]: false,
    ["Aleve", "Anaprox", "Naprosyn"]: false,
    ["Excedrin" "Migraine", "Excedrin"]: false,
    ["DHE-45", "injection", "Ergomar"]: false,
    ["Zomig"]: false
  };

  List meds = [false, false, false, false, false];

  // foods[foods.indexWhere((element) => element.uid == food.uid)] = food;

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 24);

  void _setMedications(int value) =>
      setState(() => meds[value] == !meds[value]);

  void _addToStore(store, group) {
    //     switch (group) {
    //   case 1:
    //     if (store.isYobSet) {
    //       _increaseStep(1);
    //     } else {
    //       _showErrorMessage('Please fill in all fields');
    //     }
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    // print('medications' + medications.toString());
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('medications'),
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.0),
          FlatButtonWidget(
              store: widget.store,
              callBack: widget.callBack,
              maxlines: 2,
              onPressed: () {
                var newMedications = meds;
                // newMedications[0] == !medications[0];
                newMedications[0] == !newMedications[0];
                _setMedications(0);
                setState(() => meds[0] == !newMedications[0]);
                print(meds);
                // newMedications['group1'] == true;

                // _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Advil, Motrin)'),
          FlatButtonWidget(
              store: widget.store,
              callBack: widget.callBack,
              maxlines: 2,
              onPressed: () {
                // List<bool> newMedications = medications;
                // newMedications.insert(1, !newMedications[1]);
                // _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Aleve, Anaprox, Naprosyn)'),
          FlatButtonWidget(
              store: widget.store,
              callBack: widget.callBack,
              maxlines: 2,
              onPressed: () {
                // List<bool> newMedications = medications;
                // newMedications.insert(2, !newMedications[2]);
                // _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Excedrin Migraine, Excedrin)'),
          FlatButtonWidget(
              store: widget.store,
              callBack: widget.callBack,
              maxlines: 2,
              onPressed: () {
                // List<bool> newMedications = medications;
                // newMedications.insert(3, !newMedications[3]);
                // _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(DHE-45 injection, Ergomar)'),
          FlatButtonWidget(
              store: widget.store,
              callBack: widget.callBack,
              maxlines: 2,
              onPressed: () {
                // List<bool> newMedications = medications;
                // newMedications.insert(4, !newMedications[4]);
                // _setMedications(newMedications);
              },
              type: 'medication',
              text: AppLocalizations.of(context).translate('medicationGroup') +
                  ' 1\n' +
                  '(Zomig)'),
          Expanded(
              child: new Align(
                  alignment: Alignment.bottomCenter,
                  child: new NextButtonWidget(
                      store: widget.store,
                      type: 'medication',
                      callBack: widget.callBack))),
        ],
      ),
    );
  }
}
