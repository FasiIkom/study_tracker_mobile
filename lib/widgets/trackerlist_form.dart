import 'package:flutter/material.dart';
import 'package:tilawah_tracker/widgets/left_drawer.dart';

class TrackerFormPage extends StatefulWidget {
    const TrackerFormPage({super.key});

    @override
    State<TrackerFormPage> createState() => _TrackerFormPageState();
}

class _TrackerFormPageState extends State<TrackerFormPage> {
    final _formKey = GlobalKey<FormState>();
    int _juz = 0;
    String _namasurah = "";
    int _ayat = 0;
    @override
    Widget build(BuildContext context) {
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
                                        hintText: "Juz",
                                        labelText: "Juz",
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                        _juz = int.tryParse(value!) ?? 0;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Juz tidak boleh kosong!";
                                        }
                                        if (int.tryParse(value) == null) {
                                            return "Juz harus berupa angka!";
                                        }
                                        if (_juz < 1 || _juz > 30) {
                                            return "Juz harus diantara 1-30!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Nama Surah",
                                        labelText: "Nama Surah",
                                        border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                        _namasurah = value!;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                        return "Nama Surah tidak boleh kosong!";
                                        }
                                        if (int.tryParse(value) != null) {
                                            return "Nama Surah tidak valid!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Ayat terakhir yang dibaca",
                                        labelText: "Ayat terakhir yang dibaca",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                        _ayat = int.tryParse(value!) ?? 0;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                        return "Ayat terakhir yang dibaca tidak boleh kosong!";
                                        }
                                        if (int.tryParse(value) == null) {
                                            return "Ayat terakhir yang dibaca harus berupa angka!";
                                        }
                                        if (_ayat < 1) {
                                            return "Ayat terakhir yang dibaca tidak valid!";
                                        }
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
                                        onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                      return AlertDialog(
                                                          title: const Text('Progress berhasil tersimpan'),
                                                          content: SingleChildScrollView(
                                                              child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment.start,
                                                                  children: [
                                                                      Text('Juz: $_juz'),
                                                                      Text('Nama Surah: $_namasurah'),
                                                                      Text('Ayat: $_ayat'),
                                                                  ],
                                                              ),
                                                          ),
                                                          actions: [
                                                              TextButton(
                                                                  child: const Text('OK'),
                                                                  onPressed: () {
                                                                      Navigator.pop(context);
                                                                      _formKey.currentState!.reset();
                                                                  },
                                                              ),
                                                          ],
                                                      );
                                                  },
                                              );
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