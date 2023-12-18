import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:scanshot/pages/image_page.dart';
import 'package:scanshot/widget/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanPreview extends StatefulWidget {
  ScanPreview({super.key});

  @override
  State<ScanPreview> createState() => _ScanPreviewState();
}

class _ScanPreviewState extends State<ScanPreview> {
  final camera = Camera();
  List<AssetEntity> assets = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getPermission();
    _fetchAssets();
    _scrollController.addListener(_loadMoreAssets);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_loadMoreAssets);
  }

  Future getPermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Permission granted, proceed with your functionality
    } else if (status.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      openAppSettings();
    }
  }

  void _fetchAssets() async {
    final albums = await PhotoManager.getAssetPathList(type: RequestType.image,);
    final recentAlbum = albums.first;
    if (assets.length != 0) {
      final recentAssets = await recentAlbum.getAssetListRange(start: assets.length, end: assets.length+10,);
      setState(() => assets += recentAssets);
      return;
    }
    final recentAssets = await recentAlbum.getAssetListRange(start: 0, end: 10,);
    setState(() => assets = recentAssets);
  }

  void _loadMoreAssets() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchAssets();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 37, 37, 37),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/scan');
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Stack(
                    children: <Widget> [
                      SizedBox(
                        height: 230,
                        width: 390,
                        // color: Colors.white,
                        child: camera,
                      ),
                      Container(
                        height: 230,
                        width: 390,
                        color: const Color.fromARGB(70, 255, 255, 255),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.document_scanner_outlined,
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  "Scan using camera",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 37, 37, 37),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: 390,
                  color: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 7,
                      ),
                      padding: const EdgeInsets.all(0),
                      itemCount: assets.length,
                      itemBuilder: ((context, index) {
                        return AssetThumbnail(asset: assets[index]);
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssetThumbnail extends StatelessWidget {
  final AssetEntity asset;

  const AssetThumbnail({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset.thumbnailDataWithSize(const ThumbnailSize.square(200)),
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return CircularProgressIndicator();
        return GestureDetector(
          onTap: () async {
            final file = await asset.file;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageResultScreen(imagePath: file!.path),
              ),
            );
          },
          child: Image.memory(bytes, fit: BoxFit.cover),
        );
      },
    );
  }
}
