# Tilawah Tracker

Tilawah Tracker adalah aplikasi yang membantu melacak progress tilawah Anda.

## Fitur

- Lihat progress tilawah Anda
- Tambah progress tilawah Anda
- Logout

## Cara Menggunakan

Setelah meng-clone repositori ini, Anda bisa menjalankan aplikasi dengan perintah berikut pada cmd yang sudah diarahkan ke repositori tilawah_tracker:

```
flutter run
```

Lalu pilih `1` untuk menjalankan aplikasi di Windows.

## Pengembangan
<details>
  <summary>
  <b>Tahap 1 (Tugas 7)</b>
  </summary>

  ### Membuat program flutter

  Pada direktori yang ingin digunakan untuk menyimpan aplikasi flutter, jalankan program dibawah ini.

  ```flutter create tilawah_tracker```

  ### Membuat tombol sederhana

  Di class `MyHomePage`, ubah return pada widget `build` untuk memunculkan tombol.

  ```
  return Scaffold(
        appBar: AppBar(
          title: const Text(
              'Tilawah Tracker',
          ),
        ),
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
                      fontSize: 30,
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
              ],
            ),
          ),
        ),
      );
  ```

  Tambahkan juga widget `TrackerCard`.

  ```
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
  ```

### Memunculkan _snackbar_ ketika tombol di klik

Tambahkan properti berikut pada bagian `return Material` pada class `TrackerCard`.

```
onTap: () {
              // Memunculkan SnackBar ketika diklik
              ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")));
          },
```
</details>

<details>
  <summary>
  <b>Tahap 2 (Tugas 8)</b>
  </summary>

  Empty
</details>

## Pertanyaan

<details>

  <summary>
  <b>Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?</b>
  </summary>

- **Stateless Widget**: Widget ini adalah widget yang menggambarkan bagian dari antarmuka pengguna yang dapat diubah secara konfigurasi. Stateless widget tidak dapat mengubah state mereka sendiri, tetapi mereka dapat menerima perubahan dari event yang terjadi pada parent dari widget tersebut. Contoh dari Stateless widget adalah Text, Icon, dan RaisedButton.

- **Stateful Widget**: Widget ini adalah widget yang dapat berubah sepanjang waktu. Stateful widget dapat berubah ketika terdapat suatu event, misalnya ketika diklik oleh user. Contoh dari Stateful widget adalah Checkbox, Radio, Slider, InkWell, Form, dan TextField.

</details>

<details>
<summary>
  <b>Apa saja widget yang digunakan untuk menyelesaikan aplikasi ini dan fungsinya masing-masing?</b>
</summary>

- **MyApp**: Berfungsi sebagai root widget pada aplikasi ini. `MyApp` adalah widget yang pertama kali dipanggil ketika aplikasi dijalankan.
- **MyHomePage**: Diatur sebagai `home` pada `MyApp`. Widget ini adalah widget pertama yang akan ditampilkan pada saat aplikasi dijalankan.
- **TrackerCard**: Berfungsi untuk menampilkan beberapa tombol yang mengarahkan pengguna ke berbagai fitur pilihan. Mengextend `StatelessWidget` karena tidak perlu diubah.

</details>