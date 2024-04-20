import 'package:flutter/material.dart';
import 'package:tilawah_tracker/screens/trackerlist_form.dart';

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

