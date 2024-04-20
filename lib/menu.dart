import 'package:flutter/material.dart';
import 'package:tilawah_tracker/widgets/left_drawer.dart';
import 'package:tilawah_tracker/widgets/trackerlist_form.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<TrackerItem> items = [
    TrackerItem("Lihat Progress", Icons.timeline),
    TrackerItem("Tambah Progress", Icons.add_circle_outline),
    TrackerItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Tilawah Tracker',
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                    'Menu', // Text yang menandakan tracker
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((TrackerItem item) {
                    // Iterasi untuk setiap item
                    return TrackerCard(item);
                }).toList(),
              ),
              const Text(
                '"Sesungguhnya orang-orang yang selalu membaca kitab Allah dan mendirikan shalat dan menafkahkan sebahagian dari rezeki yang Kami anugerahkan kepada mereka dengan diam-diam dan terang-terangan, mereka itu mengharapkan perniagaan yang tidak akan merugi." (QS. Fatir: 29)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class TrackerItem {
  final String name;
  final IconData icon;

  TrackerItem(this.name, this.icon);
}

class TrackerCard extends StatelessWidget {
  final TrackerItem item;

  const TrackerCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.green[900]!,
        child: InkWell(
          // Area responsive terhadap sentuhan
          onTap: () {
              // Memunculkan SnackBar ketika diklik
              ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")));
                  if (item.name == "Tambah Progress") {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TrackerFormPage(),
                          ),
                      );
                  }
          },
          child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}

