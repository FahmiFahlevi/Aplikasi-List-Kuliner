import 'package:flutter/material.dart';
import 'package:aplikasi_list_kuliner/model/makanan_model.dart';
import 'package:aplikasi_list_kuliner/page/detail_page.dart';
import 'package:aplikasi_list_kuliner/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MakananModel> _makanan = MakananModel.listMakanan;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list_alt,
                size: 30,
              ),
              Text("List Kuliner", style: textHeader1),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: _makanan.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(makanan: _makanan[index]),
                        ),
                      );
                    },
                    child: _listItem(
                      gambar: _makanan[index].gambar,
                      nama: _makanan[index].nama,
                      deskripsi: _makanan[index].deskripsi,
                      harga: _makanan[index].harga,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _listItem({
    required String gambar,
    required String nama,
    required String deskripsi,
    required String harga,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 178, 178, 178),
            offset: Offset(1.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.asset(
              gambar,
              height: 75,
              width: 85,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: textHeader1),
                const SizedBox(height: 5),
                Text(
                  deskripsi,
                  style: const TextStyle(color: Colors.black38),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Text(
                  harga,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.food_bank_rounded,
            color: iconColor,
            size: 40,
          )
        ],
      ),
    );
  }
}
