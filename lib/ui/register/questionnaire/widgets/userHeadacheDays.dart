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

  Widget _buildItem(text) {
    return Observer(
      builder: (context) {
        return ElevatedButtonWidget(
            store: widget.store,
            callBack: widget.callBack,
            type: 'userHeadacheDays',
            text: text + ' ' + AppLocalizations.of(context).translate('days'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text(AppLocalizations.of(context).translate('headachePerMonth'),
              style: titleStyle),
          SizedBox(height: 6.0),
          Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
          SizedBox(height: 24.0),
          _buildItem("1-5"),
          _buildItem("6-10"),
          _buildItem("11-15"),
          _buildItem("16-20"),
          _buildItem("21-25"),
          _buildItem("more than 25"),
        ],
      ),
    );
  }
}
