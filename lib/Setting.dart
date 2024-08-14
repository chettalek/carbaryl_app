import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, required this.title});

  final String title;

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 145, 145, 145),
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
                    color: Color.fromARGB(255, 201, 201, 201),
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
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 251, 251),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 87, 87, 87)),
                            ),
                            child: TextField(),
                          ),
                          Text(' x', style: TextStyle(fontSize: 18)),
                          Text('  +  ', style: TextStyle(fontSize: 18)),
                          Container(
                            height: 25,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 251, 251),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 87, 87, 87)),
                            ),
                            child: TextField(),
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
                    color: Color.fromARGB(255, 201, 201, 201),
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
                          Text('6.356', style: TextStyle(fontSize: 18)),
                          Text('x', style: TextStyle(fontSize: 18)),
                          Text('  +  ', style: TextStyle(fontSize: 18)),
                          Text('6.4671', style: TextStyle(fontSize: 18)),
                         
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
              child: Container(
                height: 60,
                 width: 280,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 78, 255, 170),
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Save',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold)),
                      
                    ],
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
