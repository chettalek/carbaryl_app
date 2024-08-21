import 'dart:io';
import 'package:intl/intl.dart';
import 'package:carbaryl_app/getcolor.dart';
import 'package:carbaryl_app/test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Setting.dart';
import 'package:image_picker/image_picker.dart';

class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  double mm = 0;
  double CC = 0;
  double xx = 0;
  Color D1 = Colors.white;
  Color D2 = Colors.white;
  Color D3 = Colors.white;
  Color Control = Colors.white;
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
      xx = prefs.getDouble("xx") ?? 0;
    });
  }

//////

  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
        source: ImageSource.camera, maxHeight: 600, maxWidth: 400);
    setState(() {
      _imageFile = pickedFile;
    });
    if (_imageFile != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ColorPickerPage(
                    pic: _imageFile,
                  ))).then((val) {
        print(val);
        if (val != null) {
          setState(() {
            D1 = val["D1"];
            D2 = val["D2"];
            D3 = val["D3"];
            Control = val["Control"];
          });
          print("rgbbbb = ${D1.red}");
        }
      });
    }
  }

///////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text('Analysis'),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 40,
            onPressed: () {},
            icon: Icon(Icons.file_download_outlined),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 218, 218, 218),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Communication', style: TextStyle(fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            (D2 == Colors.white)
                                ? "0"
                                : '${NumberFormat("#,###.##").format(((mm * D2.red) + CC))}',
                            style: TextStyle(fontSize: 64),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 22),
                            child: Text('mg kg-1'),
                          ),
                        ],
                      ),
                      Text('Risk : ', style: TextStyle(fontSize: 20))
                    ],
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  itemcircle("D1", D1),
                  itemcircle("D2", D2),
                  itemcircle("D3", D3)
                ],
              ),
            ),
            itemcircle("Control", Control),
            Spacer(),
            Padding(
              padding: (Platform.isAndroid)
                  ? EdgeInsets.all(0)
                  : EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            iconSize: 50,
                            onPressed: () {},
                            icon: Icon(
                              Icons.auto_graph,
                              size: 55,
                              color: Color.fromARGB(255, 59, 194, 149),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      iconSize: 50,
                      onPressed: () {
                        _pickImage();
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 60,
                        color: Color.fromARGB(255, 59, 194, 149),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            iconSize: 50,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingPage(
                                            title: 'Setting',
                                          ))).then((val) {
                                getdata();
                              });
                            },
                            icon: Icon(
                              Icons.settings,
                              size: 55,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    floatingActionButton:
    FloatingActionButton(
      onPressed: _pickImage,
      child: Icon(Icons.camera_alt),
    );
  }

  Widget itemcircle(title, touchcolor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              color: touchcolor,
              border:
                  Border.all(width: 5, color: Color.fromARGB(255, 87, 87, 87)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
      ],
    );
  }
}
