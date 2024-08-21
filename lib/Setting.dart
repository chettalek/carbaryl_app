import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.title});
  final String title;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  var m = TextEditingController();
  var C = TextEditingController();
  double mm = 0;
  double CC = 0;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mm = prefs.getDouble("mm") ?? 0;
      CC = prefs.getDouble("CC") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 130,
                width: 500,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 218, 218),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 18, bottom: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Edit Standard curve',
                          style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          Text('y = ', style: TextStyle(fontSize: 18)),
                          Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 251, 251),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 87, 87, 87)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                controller: m,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  //FilteringTextInputFormatter.digitsOnly
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r"[0-9.]")),
                                ],
                              ),
                            ),
                          ),
                          Text(' x', style: TextStyle(fontSize: 18)),
                          Text('  +  ', style: TextStyle(fontSize: 18)),
                          Container(
                            height: 35,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 251, 251),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 87, 87, 87)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: TextField(
                                controller: C,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                inputFormatters: <TextInputFormatter>[
                                  //FilteringTextInputFormatter.digitsOnly
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r"[0-9.]")),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Container(
                height: 130,
                width: 500,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 218, 218),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 18, bottom: 35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Standard curve', style: TextStyle(fontSize: 18)),
                      Row(
                        children: [
                          Text('y = ', style: TextStyle(fontSize: 18)),
                          Text('$mm', style: TextStyle(fontSize: 18)),
                          Text('x', style: TextStyle(fontSize: 18)),
                          Text('  +  ', style: TextStyle(fontSize: 18)),
                          Text('$CC', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                )),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: GestureDetector(
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (m.text.isNotEmpty) {
                    await prefs.setDouble(
                        'mm', (m.text.isEmpty) ? 0 : double.parse(m.text));
                    setState(() {
                      mm = (m.text.isEmpty) ? 0 : double.parse(m.text);
                    });
                  }
                  if (C.text.isNotEmpty) {
                    await prefs.setDouble(
                        'CC', (C.text.isEmpty) ? 0 : double.parse(C.text));
                    setState(() {
                      CC = (C.text.isEmpty) ? 0 : double.parse(C.text);
                    });
                  }
                },
                child: Container(
                  height: 60,
                  width: 280,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 83, 213, 150),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Save',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
