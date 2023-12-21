import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:scanshot/widget/loading.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scanshot/widget/dialog_error.dart';

class ImageResultScreen extends StatefulWidget {
  final String imagePath;

  const ImageResultScreen({super.key, required this.imagePath});

  @override
  State<ImageResultScreen> createState() => _ImageResultScreenState();
}

class _ImageResultScreenState extends State<ImageResultScreen> {
  TextEditingController noKKController = TextEditingController();
  TextEditingController kepalaDanAlamatController = TextEditingController();
  TextEditingController daerahController = TextEditingController();
  TextEditingController namaAnggotaController = TextEditingController();
  TextEditingController nikAnggotaController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController agamaAnggotaController = TextEditingController();
  TextEditingController pendidikanAnggotaController = TextEditingController();
  TextEditingController pekerjaanAnggotaController = TextEditingController();
  TextEditingController golDarahAnggotaController = TextEditingController();
  TextEditingController perkawinanAnggotaController = TextEditingController();
  TextEditingController statusHubunganAnggotaController = TextEditingController();
  TextEditingController kewarganegaraanAnggotaController = TextEditingController();
  TextEditingController ayahAnggotaController = TextEditingController();
  TextEditingController ibuAnggotaController = TextEditingController();
  TextEditingController tglKeluarController = TextEditingController();
  late Map<String, TextEditingController> controllers;
  final db = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final auth = FirebaseAuth.instance;
  late User user;
  bool isLoading = false;
  String scannedText = '';
  late File originalImage;
  late File currentImage;

  @override
  void initState() {
    user = auth.currentUser!;
    originalImage = File(widget.imagePath);
    currentImage = originalImage;
    super.initState();
    controllers = {
      'No_KK' : noKKController,
      'Kepala_&_Alamat' : kepalaDanAlamatController,
      'Daerah' : daerahController,
      'Nama_Anggota' : namaAnggotaController,
      'NIK_Anggota' : nikAnggotaController,
      'Jenis_Kelamin_Anggota' : jenisKelaminController,
      'Tempat_Lahir_Anggota' : tempatLahirController,
      'Tanggal_Lahir_Anggota' : tanggalLahirController,
      'Agama_Anggota' : agamaAnggotaController,
      'Pendidikan_Anggota' : pendidikanAnggotaController,
      'Pekerjaan_Anggota' : pekerjaanAnggotaController,
      'GolDarah_Anggota' : golDarahAnggotaController,
      'Perkawinan_Anggota' : perkawinanAnggotaController,
      'Status_Hubungan_Anggota' : statusHubunganAnggotaController,
      'Kewarganegaraan_Anggota' : kewarganegaraanAnggotaController,
      'Ayah_Dari_Anggota' : ayahAnggotaController,
      'Ibu_Dari_Anggota' : ibuAnggotaController,
      'TGL_Dikeluarkan' : tglKeluarController,
    };
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
          controllers[key]!.text = resultText.text;
        },
      );
    }
    // List<String> namaLines = controllers['Nama_Anggota']!.text.split('\n');
    // print(namaLines[2]);
  }

  Future<void> saveResult() async {
    var time = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = storage.ref().child('scanned-image').child(user.uid).child('$time.png');
    await ref.putFile(currentImage);
    var url = await ref.getDownloadURL();

    List<String> noKKLines = controllers['No_KK']!.text.split('\n');
    List<String> kepalaDanAlamatLines = controllers['Kepala_&_Alamat']!.text.split('\n');
    List<String> daerahLines = controllers['Daerah']!.text.split('\n');
    List<String> namaLines = controllers['Nama_Anggota']!.text.split('\n');
    List<String> nikLines = controllers['NIK_Anggota']!.text.split('\n');
    List<String> jenisKelaminLines = controllers['Jenis_Kelamin_Anggota']!.text.split('\n');
    List<String> tempatLahirLines = controllers['Tempat_Lahir_Anggota']!.text.split('\n');
    List<String> tanggalLahirLines = controllers['Tanggal_Lahir_Anggota']!.text.split('\n');
    List<String> agamaLines = controllers['Agama_Anggota']!.text.split('\n');
    List<String> pendidikanLines = controllers['Pendidikan_Anggota']!.text.split('\n');
    List<String> pekerjaanLines = controllers['Pekerjaan_Anggota']!.text.split('\n');
    List<String> golDarahLines = controllers['GolDarah_Anggota']!.text.split('\n');
    List<String> perkawinanLines = controllers['Perkawinan_Anggota']!.text.split('\n');
    List<String> hubunganLines = controllers['Status_Hubungan_Anggota']!.text.split('\n');
    List<String> kewarganegaraanLines = controllers['Kewarganegaraan_Anggota']!.text.split('\n');
    List<String> ayahLines = controllers['Ayah_Dari_Anggota']!.text.split('\n');
    List<String> ibuLines = controllers['Ibu_Dari_Anggota']!.text.split('\n');
    List<String> tglKeluarLines = controllers['TGL_Dikeluarkan']!.text.split('\n');
    int noKK = int.parse(noKKLines[0]);
    int kodePos = int.parse(kepalaDanAlamatLines[3]);

    Map<String, dynamic> riwayat = {
      'email': '${user.email}',
      'hasil' : {
        'gambar' : {
          'lokasiFile': url,
          'waktuPengambilan' : Timestamp.fromDate(DateTime.now()),
        },
        'kartuKeluarga' : {
          'anggotaKeluarga' : [],
          'noKK' : noKK,
          'kepalaKeluarga' : kepalaDanAlamatLines[0],
          'alamat' : kepalaDanAlamatLines[1],
          'rtRw' : kepalaDanAlamatLines[2],
          'kodePos' : kodePos,
          'desaKelurahan' : daerahLines[0],
          'kecamatan' : daerahLines[1],
          'kabupatenKota' : daerahLines[2],
          'provinsi' : daerahLines[3],
          'tanggalDikeluarkan' : tglKeluarLines[0],
        },
      },
    };

    for(int i = 0; i<namaLines.length; i++){
      int nik = int.parse(nikLines[i]);
      Map<String, dynamic> tmp = {
        'agama' : agamaLines[i],
        'ayah' : ayahLines[i],
        'ibu' : ibuLines[i],
        'jenisKelamin' : jenisKelaminLines[i],
        'jenisPekerjaan' : pekerjaanLines[i],
        'kewarganegaraan' : kewarganegaraanLines[i],
        'namaLengkap' : namaLines[i],
        'nik' : nik,
        'pendidikan' : pendidikanLines[i],
        'statusHubungan' : hubunganLines[i],
        'statusPerkawinan' : perkawinanLines[i],
        'tanggalLahir' : tanggalLahirLines[i],
        'tempatLahir' : tempatLahirLines[i],
        'golonganDarah' : golDarahLines[i],
      };
      // riwayat['hasil']['kartuKeluarga']['anggotaKeluarga'][i] = tmp;
      riwayat['hasil']['kartuKeluarga']['anggotaKeluarga'].add(tmp);
    }

    CollectionReference history = FirebaseFirestore.instance.collection('history');
    await history.doc('xn18Pgla7ZI2XFpN7YBH').update({
      'riwayat': FieldValue.arrayUnion([riwayat]),
    });
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
            toolbarTitle: "Pemangkas Gambar",
            toolbarColor: const Color(0xFFFFC60B),
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: "Pemangkas Gambar",
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

  Widget textField(label, controller) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: FormBuilderTextField(
        name: '$label',
        controller: controller,
        maxLines: null,
        decoration: InputDecoration(
          labelText: '$label',
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFFFC60B)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Color(0xFFFFC60B)),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
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
                    child: Column(
                      children: [
                        textField('Nomor KK', noKKController),
                        textField('Kepala Keluarga & Alamat', kepalaDanAlamatController),
                        textField('Daerah', daerahController),
                        textField('Nama Anggota', namaAnggotaController),
                        textField('NIK Anggota', nikAnggotaController),
                        textField('Jenis Kelamin Anggota', jenisKelaminController),
                        textField('Tempat Lahir Anggota', tempatLahirController),
                        textField('Tanggal Lahir Anggota', tanggalLahirController),
                        textField('Agama Anggota', agamaAnggotaController),
                        textField('Pendidikan Anggota', pendidikanAnggotaController),
                        textField('Pekerjaan Anggota', pekerjaanAnggotaController),
                        textField('Gol. Darah Anggota', golDarahAnggotaController),
                        textField('Status Perkawinan Anggota', perkawinanAnggotaController),
                        textField('Status Hubungan Keluarga', statusHubunganAnggotaController),
                        textField('Kewarganegaraan Anggota', kewarganegaraanAnggotaController),
                        textField('Ayah Dari Anggota', ayahAnggotaController),
                        textField('Ibu Dari Anggota', ibuAnggotaController),
                        textField('Tanggal Dikeluarkan', tglKeluarController),
                      ],
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
                      .then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    }, //function scan image
                    backgroundColor: const Color(0xFFFFC60B),
                    child: const Icon(Icons.document_scanner, color: Color(0xFF252525),),
                  ),
                ),
                noKKController.text == '' ? const SizedBox.shrink() : Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      saveResult()
                      .then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.pushNamed(context, '/');
                      }).onError((error, stackTrace) {
                        setState(() {
                          isLoading = false;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DialogError(
                              error: "Ada yang salah dalam form, pastikan tidak ada kekeliruan atau kesalahan dalam data hasil pindaian",
                            );
                          },
                        );
                      });
                    },
                    backgroundColor: const Color(0xFFFFC60B),
                    child: const Icon(Icons.save, color: Color(0xFF252525),),
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