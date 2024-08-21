import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class ColorPickerPage extends StatefulWidget {
  @override
  _ColorPickerPageState createState() => _ColorPickerPageState();

  final XFile? pic;
  ColorPickerPage({required this.pic});
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  bool _isTapped = false;
  Offset? _tapPosition;
  // ตำแหน่งที่คลิก
  Offset? _iconPosition; // ตำแหน่งของไอคอนเมื่อมีการลาก

  List<Color> colors = [];
  String onselect = "D1";
  Color D1 = Colors.white;
  Color D2 = Colors.white;
  Color D3 = Colors.white;
  Color Control = Colors.white;
  @override
  void initState() {
    super.initState();
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    setState(() {
      _tapPosition = details.localPosition; // เก็บตำแหน่งที่คลิก
    });
    _loadImageAndExtractColors(details.localPosition, onselect);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _tapPosition = details.localPosition; // เก็บตำแหน่งที่คลิก
    });
    // แสดงพิกัดการแตะ
    print('Offset: ${details.localPosition}');
    // โหลดรูปและดึงสี
    _loadImageAndExtractColors(details.localPosition, onselect);
  }

  Future<void> _loadImageAndExtractColors(Offset off, pick) async {
    final Uint8List bytes = await widget.pic!.readAsBytes();

    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;

    if (off.dx >= 0 &&
        off.dx < image.width &&
        off.dy >= 0 &&
        off.dy < image.height) {
      final int pixel = image.getPixel(off.dx.toInt(), off.dy.toInt());
      final Color color = Color.fromARGB(
        img.getAlpha(pixel),
        img.getRed(pixel),
        img.getGreen(pixel),
        img.getBlue(pixel),
      );
      setState(() {
        if (pick == "D1") {
          D1 = color;
        } else if (pick == "D2") {
          D2 = color;
        } else if (pick == "D3") {
          D3 = color;
        } else {
          Control = color;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context,
                    {"D1": D1, "D2": D2, "D3": D3, "Control": Control});
              },
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 35,
              ),
            ),
          )
        ],
        title: Text('Color Picker'),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          child: Column(
            children: [
              GestureDetector(
                onTapDown: _handleTapDown,
                onPanUpdate: _handlePanUpdate,
                child: Stack(
                  children: [
                    Image.file(
                      File(widget.pic!.path),
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Center(
                            child: Text('This image type is not supported'));
                      },
                    ),
                    if (_tapPosition != null) // ตรวจสอบว่ามีการคลิกหรือไม่
                      Positioned(
                        left: _tapPosition!.dx - 20, // ปรับตำแหน่งของไอคอน
                        top: _tapPosition!.dy - 20,
                        child: Image.asset('assets/images/scope3.png',
                            color: Colors.red),
                        width: 30,
                        height: 30,
                        //Icon(Icons.dangerous, color: Colors.blue, size: 40),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    itemcircle("D1", D1),
                    itemcircle("D2", D2),
                    itemcircle("D3", D3),
                    itemcircle("Control", Control)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemcircle(title, touchcolor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        GestureDetector(
          onTap: () {
            setState(() {
              onselect = title;
            });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: touchcolor,
                border: Border.all(
                    width: 5,
                    color: (onselect == title)
                        ? Colors.green
                        : Color.fromARGB(255, 87, 87, 87)),
                borderRadius: BorderRadius.all(Radius.circular(100))),
          ),
        ),
      ],
    );
  }
}
