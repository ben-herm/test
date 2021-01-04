import 'package:Relievion/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:Relievion/utils/locale/app_localization.dart';
import 'package:Relievion/stores/theme/text_styles.dart';
import 'package:flutter/rendering.dart';
import 'package:Relievion/widgets/next_button.dart';
import 'package:flutter/cupertino.dart';

class UserMigrainTriggers extends StatefulWidget {
  final store;
  final String type;
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function callBack;
  UserMigrainTriggers(
      {Key key,
      this.store,
      this.callBack,
      this.type,
      this.controller,
      this.focusNode})
      : super(key: key);
  @override
  _UserMigrainTriggersState createState() => _UserMigrainTriggersState();
}

class _UserMigrainTriggersState extends State<UserMigrainTriggers> {
  // inputValues:--------------------------------------------------------
  int height;
  List<String> triggers = [
    "skippedMeail",
    "alcohol",
    "coffeine",
    "certainFood",
    "dehydration",
    "heat",
    "humidWeather",
    "lowHumidity",
    "certainOdors",
    "weekend",
    "travel",
    "phsyicalActivity",
    "lackOfSleep",
    "stress",
    "other"
  ];

  List<String> finalTriggers = [];
  void _addTriggers(String value) => setState(() => finalTriggers.add(value));
  void _removeTriggers(String value) =>
      setState(() => finalTriggers.remove(value));
  void _setHeight(int value) => setState(() => height = value);

  TextStyle titleStyle = TextStyles.h1Style.copyWith(fontSize: 20);
  final ScrollController myScrollWorks = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      width: MediaQuery.of(context).size.width,
      child: _buildMain(widget.store),
    );
  }

  Widget getTextWidgets(List<String> strings) {
    return new Row(children: strings.map((item) => new Text(item)).toList());
  }

  Widget renderImages(index) {
    return Container(
      child: ClipRRect(
          // borderRadius: BorderRadius.(20.0),
          child: Column(
        children: [
          InkWell(
            onTap: () {
              if (finalTriggers.contains(triggers[index])) {
                print('removing' + triggers[index]);
                _removeTriggers(triggers[index]);
              } else {
                print('adding' + triggers[index]);
                _addTriggers(triggers[index]);
              }
              print(finalTriggers.toString());
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: finalTriggers.contains(triggers[index])
                      ? Colors.red
                      : Colors.black,
                ),
              ),
              child: CustomImageWidget(
                  image: 'assets/images/imagePlaceholder.png'),
            ),
          ),
          Text(
            AppLocalizations.of(context).translate(triggers[index]),
            style: TextStyle(fontSize: 13),
          )
        ],
      )),
    );
  }

  Widget _buildMain(_store) {
    return Column(
      // mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(AppLocalizations.of(context).translate('migrainTriggerMain'),
            style: titleStyle),
        SizedBox(height: 6.0),
        Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0)),
        Text(AppLocalizations.of(context).translate('migrainTriggerSub'),
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 15,
            )),
        SizedBox(height: 10.0),
        Expanded(
            child: PrimaryScrollController(
                controller: myScrollWorks,
                child: CupertinoScrollbar(
                  thickness: 5,
                  child: CustomScrollView(
                    shrinkWrap: false,
                    slivers: [
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 120.0,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.8,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                                alignment: Alignment.center,
                                // color: Colors.teal[100 * (index % 9)],
                                child: Column(
                                  children: [
                                    renderImages(index),
                                  ],
                                ));
                          },
                          childCount: 15,
                        ),
                      ),
                    ],
                  ),
                ))),
        SizedBox(height: 25),
        Align(
            alignment: Alignment.bottomCenter,
            child: new NextButtonWidget(
              store: widget.store,
              type: 'userTriggers',
              checkError: false,
              callBack: widget.callBack,
              value: finalTriggers,
              btnType: "2",
            )),

        // _buildNextButton(_store, 'userHeight')
      ],
    );
  }
}
