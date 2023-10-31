import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  XFile? image;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      controller = CameraController(cameras![0], ResolutionPreset.max);
      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print(Text("No Camera Found", style: TextStyle(color: Colors.white),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 230,
      // width: 315,
      child: controller == null ? Center(child:Text("Loading Camera...", style: TextStyle(color: Colors.white),)) : !controller!.value.isInitialized ? Center(child:Text("Loading Camera...", style: TextStyle(color: Colors.white),)) : AspectRatio(aspectRatio: controller!.value.aspectRatio, child: CameraPreview(controller!),)
    );
  }
}