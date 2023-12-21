import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:scanshot/widget/loading.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImageResultScreen extends StatefulWidget {
  final String imagePath;

  const ImageResultScreen({super.key, required this.imagePath});

  @override
  State<ImageResultScreen> createState() => _ImageResultScreenState();
}

class _ImageResultScreenState extends State<ImageResultScreen> {
  bool isLoading = false;
  String scannedText = '';
  late File originalImage;
  late File currentImage;

  @override
  void initState() {
    originalImage = File(widget.imagePath);
    currentImage = originalImage;
    super.initState();
  }

  Future<(int, int)> getImageWidthAndHeight(File image) async {
    List<int> imageBytesList = image.readAsBytesSync();
    Uint8List imageBytes = Uint8List.fromList(imageBytesList);
    ui.Codec codec = await ui.instantiateImageCodec(imageBytes);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (frameInfo.image.width, frameInfo.image.height);
  }

  Future<File> getKKSection(File image, topScalar, botScalar, leftScalar, rightScalar) async {
    final dimensions = await getImageWidthAndHeight(image);
    final width = dimensions.$1;
    final height = dimensions.$2;
    int top = (height * topScalar).round();
    int bot = (height * botScalar).round();
    int left = (width * leftScalar).round();
    int right = (width * rightScalar).round();

    img.Image? originalImage = img.decodeImage(image.readAsBytesSync());
    img.Image croppedImage = img.copyCrop(originalImage!, x : left, y :  top, width : right - left, height :  bot - top);

    final tempDir = await getTemporaryDirectory();
    final imageFilePath = '${tempDir.path}/temp.png';
    Uint8List croppedImageBytes = img.encodePng(croppedImage);
    final imageFile = File(imageFilePath);
    await imageFile.writeAsBytes(croppedImageBytes);

    return imageFile;
  }

  Future<void> scanImage(image) async {
    final textRecognizer = TextRecognizer();
    Map<String, List<double>> scalar = {
      'No_KK' : [(30/746), (85/746), (380/1054), (700/1054)],
      'Kepala_&_Alamat' : [(70/746), (150/746), (240/1054), (340/1054)],
      'Daerah' : [(70/746), (150/746), (750/1054), (860/1054)],
      'Nama_Anggota' : [(190/746), (370/746), (30/1054), (220/1054)],
      'NIK_Anggota' : [(190/746), (370/746), (210/1054), (315/1054)],
      'Jenis_Kelamin_Anggota' : [(190/746), (370/746), (315/1054), (370/1054)],
      'Tempat_Lahir_Anggota' : [(190/746), (370/746), (370/1054), (500/1054)],
      'Tanggal_Lahir_Anggota' : [(190/746), (370/746), (510/1054), (580/1054)],
      'Agama_Anggota' : [(190/746), (370/746), (570/1054), (660/1054)],
      'Pendidikan_Anggota' : [(190/746), (370/746), (650/1054), (785/1054)],
      'Pekerjaan_Anggota' : [(190/746), (370/746), (780/1054), (955/1054)],
      'GolDarah_Anggota' : [(190/746), (370/746), (950/1054), (1020/1054)],
      'Perkawinan_Anggota' : [(410/746), (580/746), (30/1054), (180/1054)],
      'Status_Hubungan_Anggota' : [(410/746), (580/746), (290/1054), (400/1054)],
      'Kewarganegaraan_Anggota' : [(410/746), (580/746), (400/1054), (490/1054)],
      'Ayah_Dari_Anggota' : [(410/746), (580/746), (630/1054), (810/1054)],
      'Ibu_Dari_Anggota' : [(410/746), (580/746), (800/1054), (990/1054)],
      'TGL_Dikeluarkan' : [(570/746), (610/746), (160/1054), (250/1054)],
    };

    for (var key in scalar.keys) {
      List<double>? tmpScalars = scalar[key];
      double topScalar = tmpScalars![0];
      double botScalar = tmpScalars[1];
      double leftScalar = tmpScalars[2];
      double rightScalar = tmpScalars[3];
      File crop = await getKKSection(image, topScalar, botScalar, leftScalar, rightScalar);
      InputImage inputImage = InputImage.fromFile(crop);
      RecognizedText resultText = await textRecognizer.processImage(inputImage);
      setState(
        () {
          scannedText += key;
          scannedText += ':\n';
          scannedText += resultText.text;
          scannedText += '\n\n';
        },
      );
    }

    
    // // Nama Anggota Keluarga
    // List<double>? tmpScalars = scalar['Nama_Anggota'];
    // double topScalar = tmpScalars![0];
    // double botScalar = tmpScalars[1];
    // double leftScalar = tmpScalars[2];
    // double rightScalar = tmpScalars[3];
    // File crop = await getKKSection(image, topScalar, botScalar, leftScalar, rightScalar);
    // InputImage inputImage = InputImage.fromFile(crop);
    // RecognizedText resultText = await textRecognizer.processImage(inputImage);
    // setState(
    //   () {
    //     scannedText += resultText.text;
    //     scannedText += '\n';
    //   },
    // );
    
    // final inputImage = InputImage.fromFile(image);
    // final resultText = await textRecognizer.processImage(inputImage);
    // final dimensions = await getImageWidthAndHeight(image);
    // final width = dimensions.$1;
    // final height = dimensions.$2;

    // String text = '';
    // for (TextBlock block in resultText.blocks) {
    //   for (TextLine line in block.lines) {
    //     text += line.text;
    //     text += '\n';
    //   }
    //   text += '\n';
    // }
    // setState(
    //   () {
    //     scannedText = text;
    //   },
    // );

    // for (TextBlock block in resultText.blocks){
    //   Rect boundingBox = block.boundingBox;
    //   double top = boundingBox.top / height;
    //   double bottom = boundingBox.bottom / height;
    //   double left = boundingBox.left / width;
    //   double right = boundingBox.right / width;

    //   if ((top >= 30/746 && bottom <= 95/746) && (left >= 300/1054 && right <= 700/1054)) {
    //     print(block.text);
    //     setState(
    //       () {
    //         scannedText = '\n$scannedText${block.text}\n';
    //       },
    //     );
    //     continue;
    //   }

    //   if ((top >= 60/746 && bottom <= 160/746) && (left >= 100/1054 && right <= 350/1054)) {
    //     print(block.text);
    //     setState(
    //       () {
    //         scannedText = '\n$scannedText${block.text}\n';
    //       },
    //     );
    //     continue;
    //   }
    //   if ((top >= 60/746 && bottom <= 160/746) && (left >= 600/1054 && right <= 900/1054)) {
    //     print(block.text);
    //     setState(
    //       () {
    //         scannedText = '\n$scannedText${block.text}\n';
    //       },
    //     );
    //     continue;
    //   }
    //   if ((top >= 190/746 && bottom <= 360/746) && (left >= 30/1054 && right <= 1050/1054)) {
    //     print(block.text);
    //     setState(
    //       () {
    //         scannedText = '\n$scannedText${block.text}\n';
    //       },
    //     );
    //     continue;
    //   }
    // }
  }

  cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imgFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: "Image Cropper",
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: "Image Cropper",
        )
      ],
    );

    if (croppedFile != null) {
      imageCache.clear();
      setState(
        () {
          currentImage = File(croppedFile.path);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingWidget(widget: ImageResultScreen(imagePath: widget.imagePath,)) : Scaffold(
      backgroundColor: const Color(0xFF252525),
      appBar: AppBar(
        title: const Text('Pindai Gambar'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [ 
          Column(
            children: [
              Image.file(currentImage, height: MediaQuery.of(context).size.height/2.5, alignment: Alignment.topCenter,),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Text(
                      scannedText, 
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    onPressed: () => cropImage(originalImage), //function scan image
                    backgroundColor: const Color(0xFFFFC60B),
                    child: const Icon(Icons.crop, color: Color(0xFF252525),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      scanImage(currentImage)
                      .then((value) {setState(() {
                        isLoading = false;
                      });});
                    }, //function scan image
                    backgroundColor: const Color(0xFFFFC60B),
                    child: const Icon(Icons.document_scanner, color: Color(0xFF252525),),
                  ),
                ),
              ],
            )
          ),
        ]
      ),
    );
  }
}