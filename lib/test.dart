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
  List<Color> colors = [];
  String onselect = "D1";
  Color D1 = Colors.white;
  Color D2 = Colors.white;
  Color D3 = Colors.white;
  Color Control = Colors.white;
  @override
  void initState() {
    super.initState();
    //_loadImageAndExtractColors(Offset(5.1, 5.2));
  }

  Future<void> _loadImageAndExtractColors(Offset off, pick) async {
    // Load image from assets
    //final ByteData data = await widget.pic.readAsBytes();
    final Uint8List bytes = await widget.pic!.readAsBytes();

    // Decode image
    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    // img.Image image = img.copyResize(pickimage, width: 392, height: 694);
    //final img.Image image = img.encodeJpg(resized);

    // Define positions you want to sample colors from
    // final positions = [
    //   //Offset(5.1, 5.2), // Example positions
    //   // Offset(216.7, 254.3),
    //   // Offset(370.5, 384.5),
    // ];
    // positions.add(off);
    // List<Color> extractedColors = [];

    //for (final pos in positions) {
    // Ensure positions are within bounds
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
    //     extractedColors.add(color);
    //   }
    // }
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
                Icons.check,
                size: 30,
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
                  onTapDown: (details) {
                    // This gives you the offset of the touch event
                    print('Offset: ${details.localPosition}');
                    _loadImageAndExtractColors(details.localPosition, onselect);
                  },
                  child: Image.file(
                    File(widget.pic!.path),
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return const Center(
                          child: Text('This image type is not supported'));
                    },
                  )),
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
              // Wrap(
              //   spacing: 8.0,
              //   runSpacing: 8.0,
              //   children: colors
              //       .map((color) => Container(
              //             width: 100,
              //             height: 100,
              //             color: color,
              //           ))
              //       .toList(),
              // ),
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
