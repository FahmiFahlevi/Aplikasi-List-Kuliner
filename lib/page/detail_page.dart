import 'package:flutter/material.dart';
import 'package:aplikasi_list_kuliner/model/makanan_model.dart';
import 'package:aplikasi_list_kuliner/styles.dart';

class DetailPage extends StatelessWidget {
  final MakananModel makanan;

  const DetailPage({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(makanan.gambar),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavouriteButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 60,
              width: 450,
              decoration: const BoxDecoration(color: headerBackColor),
              padding: const EdgeInsets.all(10),
              child: Text(
                makanan.nama,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.access_time_filled,
                          color: Color.fromARGB(255, 255, 230, 0)),
                      const SizedBox(height: 8),
                      Text(makanan.waktubuka),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 8),
                      Text(makanan.kalori),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.green),
                      const SizedBox(height: 8),
                      Text(makanan.harga),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                makanan.detail,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: makanan.gambarlain.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Bahan Racikan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Image.asset(makanan.bahan[index].values.first, width: 52),
                      Text(makanan.bahan[index].keys.first),
                    ],
                  ),
                ),
                separatorBuilder: (_, index) => const SizedBox(width: 15),
                itemCount: makanan.bahan.length,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(
          isFavourite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            isFavourite = !isFavourite;
          });
        },
      ),
    );
  }
}
