import 'package:flutter/material.dart';
import 'package:scanshot/widget/camera.dart';

class ScanPreview extends StatelessWidget {
  ScanPreview({super.key});

  final List<String> images = [
    "https://i.pinimg.com/736x/f2/c0/a1/f2c0a1e29776f51197684a2188409306.jpg",
    "https://i.pinimg.com/564x/9a/f6/1f/9af61f7b8ec622d47028b99872a5b2d3.jpg",
    "https://i.pinimg.com/originals/8e/d5/44/8ed544828b683ffe43f13d7f10aa64b7.jpg",
    "https://i.pinimg.com/originals/ee/fe/7e/eefe7ebdbe6b5c028a1ac34a195423e0.jpg",
    "https://i.pinimg.com/564x/e5/01/32/e501327e09929f2a51f11e1bd649da91.jpg",
    "https://i.pinimg.com/564x/35/97/41/359741b677e8ed1d5ab2f2601fb9ee6b.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final camera = Camera();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 37, 37),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Icon(
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
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Stack(
                    children: <Widget> [
                      Container(
                        height: 230,
                        width: 390,
                        // color: Colors.white,
                        child: Camera(),
                      ),
                      Container(
                        height: 230,
                        width: 390,
                        color: Color.fromARGB(70, 255, 255, 255),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.document_scanner_outlined,
                                color: Color.fromARGB(255, 37, 37, 37),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                padding: EdgeInsets.all(0),
                height: 430,
                width: 390,
                color: Colors.transparent,
                child: ClipRRect(
                  // borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderRadius: BorderRadius.circular(15),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                  ),
                    // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    //   maxCrossAxisExtent: 200,
                    //   childAspectRatio: 1,
                    //   crossAxisSpacing: 1.2,
                    //   mainAxisSpacing: 1.2),
                    padding: EdgeInsets.all(0),
                    itemCount: 6,
                    itemBuilder: ((context, index) {
                      final image = images[index];
                      return Image(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                          height: 90.0,
                          width: 150.0,
                        );
                    }),
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