import 'package:flutter/material.dart';
import 'package:telegram_clone_ui/view/constants/constants.dart';

class SettingsPage1 extends StatefulWidget {
  @override
  State<SettingsPage1> createState() => _SettingsPage1State();
}

class _SettingsPage1State extends State<SettingsPage1> {
  var textFieldController = TextEditingController();

  String? textfieldvalue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: darkAppbarColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                flex: 7,
                child: Card(
                  color: appbarLightModeColor,
                  child: Row(
                    children: [
                      Image.asset("assets/images/download.png"),
                      SizedBox(width: 8),
                      Text(
                        "Murad",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                )),
            Expanded(
              flex: 80,
              child: Center(
                child: Text(
                  "${textfieldvalue}",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      height: MediaQuery.of(context).size.height / 17,
                      child: TextField(
                          controller: textFieldController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Bana birseyler de :)',
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 17,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              textfieldvalue = textFieldController.text;
                            });
                          },
                          child: Text("Send")),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
