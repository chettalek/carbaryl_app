// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageTouchDemoPage extends StatefulWidget {
//   @override
//   _ImageTouchDemoPageState createState() => _ImageTouchDemoPageState();

//   final XFile? pic;
//   ImageTouchDemoPage({required this.pic});
// }

// class _ImageTouchDemoPageState extends State<ImageTouchDemoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Image Touch Offset Demo'),
//           ),
//           body: Center(child: LayoutBuilder(
//               builder: (BuildContext context, BoxConstraints constraints) {
//             double height = constraints.maxHeight;
//             print(height);
//             double width = constraints.maxWidth;
//             print(width);
//             return GestureDetector(
//                 onTapDown: (details) {
//                   // This gives you the offset of the touch event
//                   print('Offset: ${details.localPosition}');
//                 },
//                 child: Image.file(
//                   File(widget.pic!.path),
//                   errorBuilder: (BuildContext context, Object error,
//                       StackTrace? stackTrace) {
//                     return const Center(
//                         child: Text('This image type is not supported'));
//                   },
//                 ));
//           }))),
//     );
//   }
// }
