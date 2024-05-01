import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tilawah_tracker/screens/menu.dart';
import 'package:tilawah_tracker/widgets/left_drawer.dart';
import 'package:intl/intl.dart';


class TrackerFormPage extends StatefulWidget {
    const TrackerFormPage({super.key});

    @override
    State<TrackerFormPage> createState() => _TrackerFormPageState();
}

class _TrackerFormPageState extends State<TrackerFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _subject = "";
    String _startStudy = "";
    int _progress = 0;
    String _catatan = "";
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                    child: Text(
                    'Tambah Progress',
                    ),
                ),
              backgroundColor: Colors.green[900]!,
              foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body:  Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Subject",
                                        labelText: "Subject",
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                        _subject = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                        return "Subject tidak boleh kosong!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "(DD/MM/YYYY)",
                                        labelText: "Start Study",
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                        _startStudy = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Tanggal mulai belajar tidak boleh kosong!";
                                        }
                                        try {
                                            // ignore: unused_local_variable
                                            var testDate = DateFormat('dd/MM/yyyy').parseStrict(value);
                                        } catch (e) {
                                            return "Tanggal mulai belajar tidak valid!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "0-100",
                                        labelText: "Progress (%)",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                        _progress = int.tryParse(value!) ?? 0;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                        return "Progress tidak boleh kosong!";
                                        }
                                        if (int.tryParse(value) == 0) {
                                            return "Progress harus berupa angka!";
                                        }
                                        if (_progress < 1) {
                                            return "Progress tidak valid!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Catatan",
                                        labelText: "Catatan",
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                        _catatan = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        return null;
                                    },
                                ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.green[900]!),
                                        ),
                                        onPressed: () async {
                                            if (_formKey.currentState!.validate()) {
                                                // Kirim ke Django dan tunggu respons
                                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                                final response = await request.postJson(
                                                    "http://localhost:8000/create-flutter/",
                                                    jsonEncode(<String, String>{
                                                        'subject': _subject,
                                                        'startStudy': _startStudy,
                                                        'progress': _progress.toString(),
                                                        'catatan': _catatan,
                                                    // TODO: Sesuaikan field data sesuai dengan aplikasimu
                                                    }),
                                                );
                                                if (context.mounted) {
                                                    if (response['status'] == 'success') {
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(const SnackBar(
                                                        content: Text("Progress baru berhasil disimpan!"),
                                                        ));
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(builder: (context) => MyHomePage()),
                                                        );
                                                    } else {
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(const SnackBar(
                                                            content:
                                                                Text("Terdapat kesalahan, silakan coba lagi."),
                                                        ));
                                                    }
                                                }
                                            }
                                        },
                                        child: const Text(
                                            "Save",
                                            style: TextStyle(color: Colors.white),
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}
