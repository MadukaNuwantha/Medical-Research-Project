// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:diabe_trek/screens/DFU/news_info_widget.dart';
import 'package:diabe_trek/screens/DFU/camera_screen.dart';
import 'package:diabe_trek/screens/DFU/gallery_image.dart';
import 'package:diabe_trek/routes/screen_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DFU Selfcare Feature')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const NewsInfo(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final cameras = await availableCameras();
                                final firstCamera = cameras.first;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CameraScreen(firstCamera),
                                  ),
                                );
                              },
                              label: const Text('Capture A Photo'),
                              icon: const Icon(Icons.camera, size: 20.0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DisplayGalleryImage(imagePath: image?.path),
                                  ),
                                );
                              },
                              label: const Text('Upload From Gallery'),
                              icon: const Icon(Icons.image_search_rounded, size: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.4,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(createRoute());
                              },
                              label: const Text('Wound History'),
                              icon: const Icon(Icons.history_edu_rounded, size: 20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
