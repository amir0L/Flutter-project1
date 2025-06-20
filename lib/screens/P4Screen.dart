import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class P4Screen extends StatelessWidget {
  const P4Screen({Key? key}) : super(key: key);

  Future<void> _openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Image capturée : ${image.path}");
    } else {
      print("Aucune image capturée");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Rectangle.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: _openCamera,
              child: Image.asset(
                'assets/cam.jpg',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
