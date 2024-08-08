import 'package:flutter/material.dart';
import 'Setting.dart';

class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 145, 145),
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
                    color: Color.fromARGB(255, 201, 201, 201),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Communication', style: TextStyle(fontSize: 18)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '0.00',
                            style: TextStyle(fontSize: 72),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 22),
                            child: Text('mg kg-1'),
                          ),
                        ],
                      ),
                      Text('Risk : ', style: TextStyle(fontSize: 18))
                    ],
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('D1'),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 231, 231),
                            border: Border.all(
                                width: 5,
                                color: Color.fromARGB(255, 87, 87, 87)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('D2'),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 231, 231, 231),
                              border: Border.all(
                                  width: 5,
                                  color: Color.fromARGB(255, 87, 87, 87)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text('D3'),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 231, 231, 231),
                            border: Border.all(
                                width: 5,
                                color: Color.fromARGB(255, 87, 87, 87)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text('Control'),
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 231, 231, 231),
                  border: Border.all(
                      width: 5, color: Color.fromARGB(255, 87, 87, 87)),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          iconSize: 50,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingPage(
                                          title: 'Setting',
                                        )));
                          },
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPage(
                                    title: 'Setting',
                                  )));
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
                    padding: const EdgeInsets.only(right: 10),
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
                                        )));
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
          ],
        ),
      ),
    );
  }
}
