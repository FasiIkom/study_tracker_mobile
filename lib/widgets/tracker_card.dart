import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tilawah_tracker/screens/list_progress.dart';
import 'package:tilawah_tracker/screens/login.dart';
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
    final request = context.watch<CookieRequest>();
    return Material(
        color: Colors.green[900]!,
        child: InkWell(
          // Area responsive terhadap sentuhan
          onTap: () async {
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
                  else if (item.name == "Lihat Progress") {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const ProgressPage()
                          ),
                      );
                  }
                  else if (item.name == "Logout") {
                      final response = await request.logout(
                          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                          "http://localhost:8000/auth/logout/");
                      String message = response["message"];
                      if (context.mounted) {
                          if (response['status']) {
                              String uname = response["username"];
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text("$message Sampai jumpa, $uname."),
                              ));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                              );
                          } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(message),
                                  ),
                              );
                          }
                      }
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

