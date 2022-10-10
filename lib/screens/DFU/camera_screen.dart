import 'dart:io';

import 'package:camera/camera.dart';
import 'package:diabe_trek/providers/dfu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen(this.camera, {super.key});
  final CameraDescription camera;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () async {
                try {
                  await _initializeControllerFuture;
                  final image = await _controller.takePicture();
                  if (!mounted) return;
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        imagePath: image.path,
                      ),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.white,
                foregroundColor: Colors.grey.shade100,
              ),
              child: const SizedBox(height: 20),
            )
          ],
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final dTUProvider = Provider.of<DFUProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text('DFU Photo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.file(
              File(imagePath),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              dTUProvider.analyzeImage(context, imagePath);
            },
            child: const Text('Analyze Image'),
          ),
        ],
      ),
    );
  }
}
