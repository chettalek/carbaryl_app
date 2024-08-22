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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Analysis()))
                    .then((Commu) {
                  print("object");
                });
                ;
              },
              child: Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 83, 213, 150),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
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
                          Icon(
                            Icons.auto_graph,
                            size: 40,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
              child: Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 83, 213, 150),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
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
                          Icon(
                            Icons.settings,
                            size: 40,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
