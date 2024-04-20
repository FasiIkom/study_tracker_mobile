import 'package:flutter/material.dart';
import 'package:tilawah_tracker/menu.dart';
import 'package:tilawah_tracker/widgets/trackerlist_form.dart';

class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
        Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                children: [
                    const DrawerHeader(
                        decoration: BoxDecoration(
                                color: Colors.green,
                            ),
                            child: Column(
                                children: [
                                    Text(
                                        'Tilawah Tracker',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                        ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10)),
                                    Text("Aplikasi Untuk Mencatat Bacaan Al-Qur'an Anda",
                                        // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                                    ),
                                ],
                            ),                    
                        ),
                    ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Halaman Utama'),
                        // Bagian redirection ke MyHomePage
                        onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage(),
                            ));
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.library_add_rounded),
                        title: const Text('Tambah Progress'),
                        // Bagian redirection ke TrackerFormPage
                        onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrackerFormPage(),
                                ),
                            );
                        },
                    ),
                ],
            ),
        );
    }
}