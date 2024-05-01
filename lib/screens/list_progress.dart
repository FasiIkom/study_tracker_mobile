import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tilawah_tracker/models/progress.dart';
import 'package:tilawah_tracker/widgets/left_drawer.dart';

class ProgressPage extends StatefulWidget {
    const ProgressPage({Key? key}) : super(key: key);

    @override
    State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
Future<List<Progress>> fetchProgress() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Progress
    List<Progress> listProgress = [];
    for (var d in data) {
        if (d != null) {
            listProgress.add(Progress.fromJson(d));
        }
    }
    return listProgress;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Progress'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProgress(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                        return const Column(
                            children: [
                                Text(
                                    "Tidak ada data progress.",
                                    style: TextStyle(
                                        color: Color(0xff59A5D8),
                                        fontSize: 20
                                    ),
                                ),
                                SizedBox(height: 8),
                            ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12
                                ),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                            "${snapshot.data![index].fields.subject}",
                                            style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("Tanggal mulai belajar: ${snapshot.data![index].fields.startStudy}"),
                                        const SizedBox(height: 10),
                                        Text("Progress: ${snapshot.data![index].fields.progress}%"),
                                        const SizedBox(height: 10),
                                        Text("Catatan: ${snapshot.data![index].fields.catatan}")
                                    ],
                                ),
                            ),
                        );
                    }
                }
            }),
        );
    }
}
