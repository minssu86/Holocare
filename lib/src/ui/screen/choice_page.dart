import 'package:flutter/material.dart';
import 'package:holocare/src/ui/widget/choice_button.dart';

import '../widget/main_text.dart';



class ChoicePage extends StatefulWidget {
  ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 104),
                  child: MainText(),
                ),
                Column(
                  children: [
                    ChoiceButton(title:"보호 대상자", type: "protected",),
                    ChoiceButton(title:"보호자", type: "protector",),
                  ],
                ),
              ],
            ),
          ),
        )

    );
  }
}