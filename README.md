# final_whistle_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

====================================== TUGAS 7 ============================================

1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Dikutip dari geeksforgeeks.org, user interface suatu aplikasi dirancang di Flutter berisi serangkaian widget yang berarti seluruh aplikasi diatur untuk terdiri dari widget. Widget menggambarkan seperti apa tampilan aplikasi dalam kondisi tertentu. 

User interface terdiri dari beberapa widget - widget yang digabungkan untuk membuat sebuah pohon widget. Untuk setiap widget pengguna, semua elemen dibuat secara bersamaan oleh framework flutter, sehingga ketika elemen - elemen ini digabungkan akan membuat sebuah pohon widget.  Pada hierarki ini, kita menghubungkan widget parent dan child untuk menunjukkan hubungan antara keduanya. Kemudian, widget-widget tersebut digabungkan untuk membentuk tampilan UI pada aplikasi.

Widget tree memiliki semua konfigurasi widget dan pohon elemen memiliki semua widget yang dirender di layar. Ada satu pohon lagi yang disebut pohon render, tetapi pengguna tidak perlu berinteraksi dengannya. Pohon render pada dasarnya adalah tata letak tingkat rendah, sistem pengecatan yang mewarisi objek render. 

Widget ini senidiri dibagi menjadi 2, yaitu : 
1) Stateless widget 
Merupakan widget yang mempunyai sifat tidak akan berubah (immutable), ketika disebabkan oleh interaksi user maupun variabel dan nilai yang ditemukan. Widget ini bersifat statis dan tidak dapat menyimpan atau mengubah data internalnya sendiri, sehingga tampilannya akan selalu tetap sama selama aplikasi berjalan dan ideal untuk elemen UI yang tidak dinamis (teks, ikon, atau logo)

- Widget ini cocok digunakan untuk membangun bagian-bagian UI yang tampilannya tidak dipengaruhi oleh interaksi pengguna atau perubahan data dinamis. 
- Contoh : Judul halaman, ikon, teks statis, atau tombol yang fungsinya hanya menampilkan suatu tanpa mengubah data (tombol raised botton yang tidak memiliki state).

Contoh : 
class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.
  final String title;  // Judul kartu.
  final String content;  // Isi kartu.
  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

2) Stateful widget adalah widget yang memiliki sifat dinamis, dapat berubah dengan adanya interaksi antar user maupun variabel dan nilai yang ditemukan. Psds dtateful widget sebelum masuk ke tahap build, ada namanya Interbak State. tahapan ini merupakan tahap untuk proses penambahan state atau perubahan data.

- Memiliki dat ainternal yang disimpan dalam sebuah objek state terpisah dan dapat dimodifikasi.
- Menggunakan setState() untuk memperbarui tampilan widget ketika terjadi perubahan state.
- Digunakan untuk membuat elemen UI yang memiliki interaksi, seperti form input, counter, atau animasi.

Contoh : 

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  int _angka = 1;

  void _increment(){
    setState(() {
      _angka += 1;
    });
  }

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=>_increment(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Stateful Widget'),
        ),
        body: Center(
          child: Text('Angka : $_angka', style: TextStyle(fontSize: 30)),
        ),
      )
    );
  }
}

Parent - Child berarti sebuah elemen (widget, tag, atau komponen), efeknya bisa menurun (inherited) ke semua child di dalamnya. Analoginya seperti parent adalah sebuah 'kotak besar' dan child adalah 'barang - barang' di dalamnya. Jika parent background berwarna merah dan tidak ada lagi pengaturan lain di child, maka semua background anak di dalamnya akan berlatar merah.

Contoh : 
Scaffold(
  appBar: AppBar(
    title: Text("Home"),   // Child dari AppBar
  ),
  body: Column(            // Parent dari anak-anak di dalam Column
    children: [
      Text("Hello World"),
      ElevatedButton(onPressed: () {}, child: Text("Click Me")),
    ],
  ),
);

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
- MyApp 
Pada file main.dart terdapat widget MyApp dengan jenis StatelessWidget yang menjadi widget utama (root) yang menjalankan aplikasi flutter (merupakan parent dari MaterialApp). Di dalam MaterialApp ini ada tema, routing, dan halaman utama (home)

- MyHomePage
pada file menu.dart terdapat widget MyHomePage dengan jenis StatelessWidget yang berfungsi menjadi halaman aplikasi yang berisi AppBar dan body (konten utama). Parentnya adalah MaterialApp (melalui 'home') dan child utamanya adalah Scaffold.

- Scaffold  menyediakan struktur dasar halaman dengan AppBar(Bagian atas halaman yang menampilkan judul) dan body (judul, font, color). Memiliki child berupa AppBar dan Padding.

- AppBar berfungsi menampilkan judul apliaksi di bagian atas dan warna background mengikuti tema dari MaterialApp.
appBar: AppBar(
  title: const Text(
    'Final Whistle',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: Theme.of(context).colorScheme.primary,
),

- Padding berfungsi memberi jarak dari tepi layar ke dalam konten agar elemen di dalamnya tidak terlalu menempel ke tepi layar.
body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(...),
),

- Coloumn berfungsi menyusun widget secara vertikal (atas ke bawah) yang terdiri dari dua bagian utama yaitu row yang berisi info mahasiswa dan center + gridview yang berisi menu item (AllProducts, MyProducts, dst)
child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Row(...),
    SizedBox(height: 16),
    Center(...)
  ],
),

- Row berfungsi menyusun widget secara horizontal (kiri ke kanan) yang menampilkan 3 kartu (InfoCard) sejajar di satu baris serta spaceEvenly memberi jarak yang sama antar kartu.
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: nama),
    InfoCard(title: 'Class', content: kelas),
  ],
),

- Infocard adalah widget untuk menampilkan informasi seperti NPM, Nama, dan Kelas. 
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
}

- Center + Coloumn menyusun teks sambutan dan grid menu di tengah halaman.
Center(
  child: Column(
    children: [
      Text('Welcome to Final Whistle'),
      GridView.count(...),
    ],
  ),
),

- GridView.count membuat layout grid seperti tabel untuk tombol menu. Berfungasi menampilkan daftar ItemCard dalam 3 kolom. shrinkWrap: true digunakan supaya tinggi grid menyesuaikan isi, tidak memanjang.

GridView.count(
  crossAxisCount: 3,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  shrinkWrap: true,
  children: items.map((item) => ItemCard(item)).toList(),
),

- ItemCard merupakan widget yang menampilkan tombol menu yang berisi Material Memberi efek Material Design (warna & bayangan), InkWell (Memberi efek klik & aksi ketika ditekan), SnackBar (Menampilkan pesan pop-up di bawah layar).

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
}

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp adalah widget utama yang menjadi root dari aplikasi Flutter berbasis Material Design yang fungsi utamanya adalah : 

1) Menyediakan tema dan warna global 
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo),
),
Dari ssini, kita dapat mengatur warna utama, font, ikon, dan gaya tombol yang akan berlaku di seluruh apliaksi.

2) Menentukan halaman awal (home)
home: MyHomePage(),

3) Menyediakan sistem navigasi dan rute
MaterialApp mempermudah berpindah antar halaman menggunakan Navigator.push() dan Navigator.pop()

4) Mengatur title & localization
Title muncul di task manager atau saat aplikasi dijalankan di browser/web.

5) Menyediakan integrasi material design components 
Seperti AppBar, Scaffold, FloatingActionButton, SnackBar, dll. Tanpa MaterialApp, widget-widget ini tidak akan tampil dengan gaya Material.

MaterialApp kerap kali digunakan sebagai widget root karena menjadi pembungkus seluruh UI dan navigasi aplikasi, menyediakan context global untuk tema, rute, dan konfigurasi dasar. Jadi tanpa MaterialApp, aplikasi Flutter tidak akan terlihat seperti aplikasi modern.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Dikutip dari zelixify, Stateless Widget adalah widget yang tidak menyimpan atau mengubah data internal setelah dibuat. Jadi, tampilan aplikasi akan selalu tetap sama selama widget tersebut hidup. Widget ini cocok digunakan untuk elemen UI yang bersifat statis, misalnya adalah judul halaman, ikon, atau tombol yang tampilannya tidak berubah. Performanya juga lebih ringan karena tidak perlu memantau perubahan state.
Contoh : 
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello!");
  }
}

Sedangkan statefull widget memiliki state atau data internal yang dapat berubah saat aplikasi berjalan, misalnya seperti tombol like yang dapat bertambah hitungannya, form input, atau animasi yang berubah seiring berjalannya waktu. Statefull ini digunakan jika ada interaksi atau data yang dapat berubah, seperti tombol, input, animasi, atau API call.

Contoh : 

class MyCounter extends StatefulWidget {
  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('Tambah'),
        ),
      ],
    );
  }
}


5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang menyimpan informasi posisi widget di dalam pohon widget (widget tree). Fungsinya adalah menjadi alamat bagi setiap widget dalam widget tree, digunakan untuk mengakses data dari root widget (parent) seperti : 
- Theme → Theme.of(context)
- Navigator → Navigator.of(context)
- MediaQuery → MediaQuery.of(context)

Contoh : 
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primary, // akses warna dari theme
  );
}

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
1) Hot Reload 
adalah fitur di Flutter yang memungkinkan pengembang memperbarui tampilan aplikasi dengan cepat tanpa kehilangan data atau posisi halaman yang sedang aktif. Ketika kamu mengubah kode seperti warna, teks, atau tata letak (layout), lalu menekan tombol Hot Reload, Flutter hanya memperbarui bagian UI yang berubah tanpa memulai ulang aplikasi. Contohnya, jika kamu mengubah warna AppBar dari merah menjadi biru dan menekan Hot Reload, maka warna AppBar akan langsung berubah di layar tanpa mengulang dari halaman awal atau menghapus data yang sedang ditampilkan.

2) Hot restart 
berbeda karena menjalankan ulang seluruh aplikasi dari awal dan menghapus semua data atau state yang tersimpan sementara. Fitur ini digunakan jika kamu mengubah logika awal aplikasi, variabel global, atau struktur widget utama yang tidak bisa diperbarui dengan Hot Reload. Contohnya, jika kamu mengubah nilai awal dari variabel counter di main() atau mengganti widget root dari MyApp menjadi NewApp, kamu harus menggunakan Hot Restart agar perubahan tersebut diterapkan secara penuh.