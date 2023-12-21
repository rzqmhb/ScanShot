import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scanshot/models/hasil.dart';
import 'package:scanshot/widget/footer.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  Future<Uint8List> saveImage(String imageUrl) async {
    final data = await rootBundle.load(imageUrl);
    return data.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final hasil = ModalRoute.of(context)!.settings.arguments as Hasil;
    final gambar = hasil.gambar!;
    final kartuKeluarga = hasil.kartuKeluarga!;

    String textKartuKeluarga =
        "Kartu Keluarga\nNo.K: ${kartuKeluarga.noK}\nNo.KK: ${kartuKeluarga.noKK}\nKepala Keluarga: ${kartuKeluarga.kepalaKeluarga}\nAlamat: ${kartuKeluarga.alamat}\nRT/RW: ${kartuKeluarga.rt}/${kartuKeluarga.rw}\nKode Pos: ${kartuKeluarga.kodePos}\nDesa/Kelurahan: ${kartuKeluarga.desaKelurahan}\nKecamatan: ${kartuKeluarga.kecamatan}\nKabupaten/Kota: ${kartuKeluarga.kabupatenKota}\nProvinsi: ${kartuKeluarga.provinsi}\nTanggal Dikeluarkan: ${kartuKeluarga.tanggalDikeluarkan}\nKepala Dinas: ${kartuKeluarga.kepalaDinas}\nNIP Kepala Dinas: ${kartuKeluarga.nipKepalaDinas}\n\nAnggota Keluarga\n";

    for (var anggotaKeluarga in kartuKeluarga.anggotaKeluarga) {
      String anggotaText =
          "NIK: ${anggotaKeluarga.nik}\n\nNama Lengkap: ${anggotaKeluarga.namaLengkap}\nJenis Kelamin: ${anggotaKeluarga.jenisKelamin}\nTempat Lahir: ${anggotaKeluarga.tempatLahir}\n Tanggal Lahir: ${anggotaKeluarga.tanggalLahir}\nAgama: ${anggotaKeluarga.agama}\nPendidikan: ${anggotaKeluarga.pendidikan}\nJenis Pekerjaan: ${anggotaKeluarga.jenisPekerjaan}\nStatus Perkawinan: ${anggotaKeluarga.statusPerkawinan}\nStatus Hubungan: ${anggotaKeluarga.statusHubungan}\nKewarganegaraan: ${anggotaKeluarga.kewarganegaraan}\nNo.Paspor: ${anggotaKeluarga.noPaspor}\nNo.Kitap: ${anggotaKeluarga.noKitap}\nAyah: ${anggotaKeluarga.ayah}\nIbu: ${anggotaKeluarga.ibu}\n\n";
      textKartuKeluarga += anggotaText;
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 26,
            left: 26,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/back_icon.png',
                width: 20,
                height: 17,
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 26,
            right: 26,
            bottom: 72,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Hero(
                          tag: '${gambar.idGambar}',
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                gambar.lokasiFile.toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            saveImage(gambar.lokasiFile.toString());
                          },
                          child: Image.asset(
                            'assets/download_icon.png',
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Hero(
                          tag: '${kartuKeluarga.idKK}',
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SelectableText(
                                textKartuKeluarga,
                                style: const TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/form', arguments: kartuKeluarga);
                          },
                          child: Image.asset(
                            'assets/form_icon.png',
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const Positioned(
            child: FooterWidget(),
          ),
        ],
      ),
    );
  }
}
