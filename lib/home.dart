import 'package:carbaryl_app/Analysis.dart';
import 'package:carbaryl_app/Setting.dart';
import 'package:carbaryl_app/test.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  double mm = 0;
  double CC = 0;
  bool _pressedAna = false;
  bool _pressedSet = false;
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/Food.png'),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Analysis()))
                      .then((Commu) {
                    print("object");
                  });
                  ;
                },
                onTapDown: (_) {
                  setState(() {
                    _pressedAna = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _pressedAna = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _pressedAna = false;
                  });
                },
                child: AnimatedContainer(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: _pressedAna
                          ? Colors.green[700]
                          : Color.fromARGB(255, 83, 213, 150),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  duration: Duration(milliseconds: 100),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Analysis ',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingPage(
                                title: 'Setting',
                              ))).then((val) {
                    getdata();
                  });
                },
                onTapDown: (_) {
                  setState(() {
                    _pressedSet = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    _pressedSet = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    _pressedSet = false;
                  });
                },
                child: AnimatedContainer(
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                      color: _pressedSet
                          ? Colors.green[700]
                          : Color.fromARGB(255, 83, 213, 150),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  duration: Duration(milliseconds: 100),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Setting ',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset('assets/images/MSN.png'),
              Image.asset('assets/images/Carbarly.png'),
            ],
          ),
        ),
      ),
    );
  }
}
