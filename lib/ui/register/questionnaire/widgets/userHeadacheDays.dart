import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/widgets/elevated_button.dart';
import 'package:flutter/rendering.dart';

class UserHeadacheDays extends StatefulWidget {
  final store;
  final Function callBack;
  UserHeadacheDays({Key key, this.store, this.callBack}) : super(key: key);
  @override
  _UserHeadacheDaysState createState() => _UserHeadacheDaysState();
}

class _UserHeadacheDaysState extends State<UserHeadacheDays> {
  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 24);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(AppLocalizations.of(context).translate('headachePerMonth'),
            style: titleStyle),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        SizedBox(height: 24.0),
        Observer(
          builder: (context) {
            return ElevatedButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userHeadacheDays',
                text: '1-5 ' + AppLocalizations.of(context).translate('days'));
          },
        ),
        // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
        Observer(
          builder: (context) {
            return ElevatedButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userHeadacheDays',
                text: '6-10 ' + AppLocalizations.of(context).translate('days'));
          },
        ),
        Observer(
          builder: (context) {
            return ElevatedButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userHeadacheDays',
                text:
                    '11-15 ' + AppLocalizations.of(context).translate('days'));
          },
        ),
        Observer(
          builder: (context) {
            return ElevatedButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userHeadacheDays',
                text:
                    '16-20 ' + AppLocalizations.of(context).translate('days'));
          },
        ),
        Observer(
          builder: (context) {
            return ElevatedButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userHeadacheDays',
                text:
                    '21-25 ' + AppLocalizations.of(context).translate('days'));
          },
        ),
        Observer(
          builder: (context) {
            return ElevatedButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userHeadacheDays',
                text: AppLocalizations.of(context).translate('moreThen') +
                    ' 25 ' +
                    AppLocalizations.of(context).translate('days'));
          },
        ),
      ],
    );
  }
}
