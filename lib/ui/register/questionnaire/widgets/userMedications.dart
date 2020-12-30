import 'package:Relievion/widgets/flat_button.dart';
import 'package:Relievion/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/widgets/elevated_button.dart';
import 'package:flutter/rendering.dart';

class UserMedications extends StatefulWidget {
  final store;
  final Function callBack;
  UserMedications({Key key, this.store, this.callBack}) : super(key: key);
  @override
  _UserMedicationsState createState() => _UserMedicationsState();
}

class _UserMedicationsState extends State<UserMedications> {
  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 24);

  List<bool> medications = [false, false, false, false, false];
  void _setMedications(List<bool> value) => setState(() => medications = value);

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
                List<bool> newMedications = medications;
                newMedications.insert(0, !newMedications[0]);
                _setMedications(newMedications);
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
                List<bool> newMedications = medications;
                newMedications.insert(0, !newMedications[0]);
                _setMedications(newMedications);
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
                List<bool> newMedications = medications;
                newMedications.insert(0, !newMedications[0]);
                _setMedications(newMedications);
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
                List<bool> newMedications = medications;
                newMedications.insert(0, !newMedications[0]);
                _setMedications(newMedications);
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
                List<bool> newMedications = medications;
                newMedications.insert(0, !newMedications[0]);
                _setMedications(newMedications);
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
