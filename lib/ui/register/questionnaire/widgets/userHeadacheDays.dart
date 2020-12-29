import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/widgets/flat_button.dart';
import 'package:flutter/rendering.dart';

class UserSex extends StatefulWidget {
  final store;
  final Function callBack;
  UserSex({Key key, this.store, this.callBack}) : super(key: key);
  @override
  _UserSexState createState() => _UserSexState();
}

class _UserSexState extends State<UserSex> {
  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(AppLocalizations.of(context).translate('sex'), style: titleStyle),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        Text(AppLocalizations.of(context).translate('sexSub'),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 15,
            )),
        SizedBox(height: 24.0),
        Observer(
          builder: (context) {
            return FlatButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userSex',
                text: AppLocalizations.of(context).translate('maleSex'));
          },
        ),
        // Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 50)),
        Observer(
          builder: (context) {
            return FlatButtonWidget(
                store: widget.store,
                callBack: widget.callBack,
                type: 'userSex',
                text: AppLocalizations.of(context).translate('femaleSex'));
          },
        ),
      ],
    );
  }
}
