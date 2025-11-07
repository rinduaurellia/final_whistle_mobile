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
Dikutip dari laman geeksforgreeks.org, saat membangun aplikasi dart, dibutuhkan waktu untuk eksekusi pertama kali. Jadi untuk mengatasi masalah ini, flutter memiliki fitur Hot reload dan hot restart yang membantu mengirangi wkatu eksekusi. Keduanya jauh lebih baik dan lebih cepat dibanding restart standar biasa. Fitur ini juga hanya dapat digunakan jika telah menjalankan program minimal sekali.

1) Hot Reload 
adalah fitur di Flutter yang memungkinkan pengembang memperbarui tampilan aplikasi dengan cepat tanpa kehilangan data atau posisi halaman yang sedang aktif. Ketika mengubah kode seperti warna, teks, atau tata letak (layout), lalu menekan tombol Hot Reload, Flutter hanya memperbarui bagian UI yang berubah tanpa memulai ulang aplikasi. Contohnya, jika mengubah warna AppBar dari merah menjadi biru dan menekan Hot Reload, maka warna AppBar akan langsung berubah di layar tanpa mengulang dari halaman awal atau menghapus data yang sedang ditampilkan.

- memungkinkan kita melihat perubahan yang tercermin setelah perbaikan bug, membangun antarmuka pengguna, dan bahkan menambahkan fitur tertentu ke aplikasi tanpa menjalankan aplikasi lagi dan lagi.

- Saat Hot Reload dipanggil, mesin host memeriksa kode yang diedit sejak kompilasi terakhir dan mengompilasinya lagi.

- Hot Reload tidak berfungsi saat tipe Enumerasi diubah ke Kelas reguler dan saat kelas diubah ke tipe enumerasi.

- Hot Reload tidak berfungsi saat tipe generik dimodifikasi

2) Hot restart 
berbeda karena menjalankan ulang seluruh aplikasi dari awal dan menghapus semua data atau state yang tersimpan sementara. Fitur ini digunakan jika ingin mengubah logika awal aplikasi, variabel global, atau struktur widget utama yang tidak bisa diperbarui dengan Hot Reload. Contohnya, jika mengubah nilai awal dari variabel counter di main() atau mengganti widget root dari MyApp menjadi NewApp, kamu harus menggunakan Hot Restart agar perubahan tersebut diterapkan secara penuh.

Dikarenakan hot restart harus menghancurkan status aplikasi yang tersimpan dan kode harus dicompile ulang sepenuhnya, maka ia membutukan waktu lebih lama dibandingkan dengan hot reload, namun lebih singkat dibanding full restart.

- Hot restart menghancurkan nilai Status yang dipertahankan dan mengaturnya ke default.

- Hot Restart memerlukan waktu lebih lama daripada Hot Reload.

- Hot reload juga dikenal sebagai 'stateful hot reload'

- Hot Reload berguna karena menghemat waktu hanya dengan mengimplementasikan fungsionalitas berdasarkan kelas build terdekat dalam waktu kurang dari 10 detik.


====================================== TUGAS 8 ============================================

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Mengutip dari website dibimbing.id, Navigasi dalam aplikasi Flutter merujuk pada cara berpindah antar tampilan atau halaman dalam aplikasi yang memungkinkan pengguna untuk menjelajahi berbagai bagian aplikasi dengan mudah, seperti berpindah dari halaman utama ke halaman add product atau all product.

Navigasi sendiri dilakukan menggunakan berbagai teknik dan widget, seperti Navigator, Drawer, dan BottomNavigatorBar yang memudahkan transisi antar halaman dengan cara yang mulus. Sedangkan navigator bekerja dengan cara memanipulasi stack (tumpukan) halaman yang artinya halaman baru dimasukkan ke atas stack sementara halaman sebelumnya disembunyikan.

  1) Navigator.push()
  Digunakan untuk menambahkan halaman baru ke atas stack navigasi. Halaman baru akan ditampilkan, sementara halaman sebelumnya tetap berada di bawah stack.
  Contoh : 
  (di product_card.dart)
  if (item.name == "Add Product") {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductFormPage()),
            );
          }
  Dalam kode ini, saat user menekan tombol 'Add Product', halaman baru akan muncul dengan transisi yang halus.
  - User dapat menekan tombol back karena halaman sebelumnya masih ada di dalam stack.
  - Cocok digunakan saat navigasi dari Home ke halaman tambah produk (karena mungkin kamu ingin user bisa menekan back untuk kembali).

  2) Navigator.pushReplacement()
  Digunakan untuk menggantikan halaman teratas dengan halaman baru, sehingga halaman sebelumnya tidak muncul dalam stack navigasi, dimana halaman lama akan terhapus dalam stack dan halaman abru akan menggantikan posisi halaman sebelumnya.
  Contoh : 
  ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
  Halaman lama akan dihapus dalam stack ketika memencet Home Page dan halaman Home Page alan menggantikan posisi halaman sebelumnya.
  - User tidak dapat kembali ke halaman sebelumnya karena halaman telah dihapus dari stack.
  - Cocok digunakan untuk navigasi dari Drawer (misalnya saat klik “Home Page” atau “Add Product”).
    Karena ketika user menekan item di drawer, kamu memang ingin mengganti halaman sepenuhnya, bukan tumpuk di atas halaman lam

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Di Flutter, semua tampilan dibangun dari widget yang tersusun secara hierarkis (bertingkat). Artinya, setiap komponen UI berada di dalam komponen lain. Struktur ini seperti pohon (widget tree) — di mana widget paling luar mengatur tata letak widget di dalamnya. Hal ini memudahkan user maupun developer dalam memahami struktur kode, serta aplikasi terasa konsisten, teratur, dan mudah dipahami.

A. Scaffold adalah rangka utama halaman flutter yang menyediakan stuktur data yang sudah umum dalam aplikasi Material Design (AppBar, Drawer, Body, FAB, dsb)
Fungsi : 
- Menjadi container halaman utama
- Menjaga layout aantar halaman agar tetap seragam
- Menyediakan area khusus untuk AppBar, Drawer, Body, FloatingActionButton, dsb.

Contoh : 
return Scaffold(
  appBar: AppBar(
    title: const Text('Final Whistle'),
    backgroundColor: Colors.indigo,
  ),
  drawer: const LeftDrawer(),
  body: ...
);
Disini Scaffold membungkus seluruh halaman utama (MyHomePage).
Sehingga halaman form (ProductFormPage) dan halaman utama (MyHomePage) memiliki layout dasar yang sama.

B. AppBar adalah bagian header di atas halaman aplikasi.
Biasanya berisi judul halaman, ikon navigasi, atau aksi cepat (seperti tombol search atau refresh).
Fungsi : 
- Menunjukkan identitas halaman (judul seperti “Final Whistle” atau “Form Tambah Produk”).
- Memberikan navigasi balik (back button) atau akses cepat.
- Menambah kesan profesional karena setiap halaman punya header seragam.

Contoh : 
appBar: AppBar(
  title: const Center(
    child: Text('Form Tambah Produk'),
  ),
  backgroundColor: Colors.indigo,
  foregroundColor: Colors.white,
),
Artinya, halaman form juga memiliki AppBar dengan warna dan gaya yang sama seperti halaman utama.
Ini menjaga keseragaman tampilan (UI consistency) antar halaman.

C. Drawer adalah menu navigasi samping (biasanya ditampilkan lewat ikon tiga garis ≡ di AppBar). Drawer memungkinkan pengguna berpindah antar halaman dengan cepat tanpa perlu kembali ke Home.
Fungsi : 
- Menjadi pusat navigasi utama aplikasi.
- Menyediakan akses ke halaman-halaman penting seperti Home, Add Product, dll.
- Menjaga user experience (UX) agar simpel dan intuitif.

Contoh : 
drawer: const LeftDrawer(),

Dimana sesuai dengan kode yang ada, Drawer berfungsi seperti menu utama aplikasi
yang memudahkan user berpindah antar halaman tanpa kehilangan konteks.

Mengapa hierarki ini penting? 
1) Menjaga aplikasi agar tetap konsisten : Setiap halaman memiliki AppBar & Drawer dengan tampilan seragam
2) Mudah dipahami pengguna : pengguna tahu di mana posisi tombol & navigasi.
3) Terstruktur: memisahkan bagian navigasi (Drawer) dan konten utama (Body) agar kode rapi.
4) Efisien: cukup buat LeftDrawer satu kali → bisa dipakai di semua halaman lain.

Dalam aplikasi Football Shop (Final Whistle), widget hierarchy dimanfaatkan untuk membangun struktur halaman yang konsisten di seluruh bagian aplikasi. Setiap halaman menggunakan Scaffold sebagai kerangka utama yang menyediakan area untuk AppBar, Drawer, dan Body. AppBar digunakan untuk menampilkan judul halaman seperti “Final Whistle” dan “Form Tambah Produk” agar pengguna mengetahui konteks halaman yang sedang dibuka. Drawer berfungsi sebagai menu navigasi utama yang memudahkan pengguna berpindah antar halaman, seperti ke Home atau ke halaman tambah produk. Dengan menerapkan struktur hierarki ini secara konsisten, setiap halaman memiliki tata letak dan tampilan yang seragam, sehingga meningkatkan kenyamanan, profesionalitas, dan kemudahan penggunaan aplikasi.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Dalam desain antarmuka (User Interface Design), tampilan yang nyaman, rapi, dan mudah diakses di semua ukuran layar adalah hal yang sangat penting.
Flutter menyediakan berbagai layout widgets seperti Padding, SingleChildScrollView, dan ListView untuk mengatur posisi, jarak, dan perilaku elemen UI secara fleksibel.

Ketiga widget ini membantu memastikan bahwa form input di aplikasi  tetap rapi dan mudah digunakan, bahkan saat form berisi banyak elemen atau dijalankan di perangkat dengan ukuran layar kecil.

1) Widget Padding : 
Padding digunakan untuk memberikan ruang (spasi) di sekitar suatu widget, agar elemen UI tidak menempel ke tepi layar atau ke widget lain. Tanpa padding, field akan terlalu menempel satu sama lain dan terkesan berantakan.
Kelebihan : 
- Membuat tampilan form lebih rapi dan proporsional.
- Meningkatkan readability (mudah dibaca) dan usability (mudah digunakan).
- Menjaga agar pengguna tidak salah sentuh antar field (terutama di layar kecil).

Contoh : 
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Nama Produk",
      labelText: "Nama Produk",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  ),
)

2) Widget SingleChildScrollView : 
Memungkinkan halaman dapat digulir (scroll) secara vertikal ketika isi form melebihi tinggi layar.
Kelebihan : 
- Mencegah overflow error (“bottom overflowed by pixels”) pada layar kecil.
- Memastikan semua elemen form dapat diakses tanpa menutupi tombol di bawah.
- Memberikan pengalaman pengguna yang lebih baik, terutama saat keyboard muncul.

Contoh : 
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Semua field form di sini
        Padding(...),
        Padding(...),
        Padding(...),
      ],
    ),
  ),
)

3) Widget ListView
Widget yang menampilkan daftar elemen secara scrollable secara vertikal. Berbeda dengan SingleChildScrollView yang hanya punya satu child, ListView dirancang khusus untuk menampilkan banyak item dinamis.

Kelebihan : 
- Efisien untuk menampilkan daftar produk atau data form dinamis.
- Otomatis dapat discroll tanpa pembungkus tambahan.
- Dapat digunakan dengan builder untuk menampilkan data banyak tanpa lag.

Dalam konteks desain antarmuka, penggunaan layout widget seperti Padding, SingleChildScrollView, dan ListView memiliki peran penting untuk menciptakan tampilan form yang nyaman dan responsif. Widget Padding digunakan untuk memberikan jarak antar elemen sehingga tampilan form menjadi rapi, seimbang, dan mudah dibaca. Sementara itu, SingleChildScrollView memungkinkan pengguna menggulir seluruh halaman form, sehingga setiap elemen dapat diakses meskipun layar perangkat berukuran kecil atau keyboard muncul. Sedangkan ListView digunakan untuk menampilkan daftar elemen yang panjang secara efisien dan otomatis dapat di-scroll.

Pada aplikasi Final Whistle, ketiga widget ini digunakan pada halaman ProductFormPage agar pengguna dapat mengisi data produk dengan nyaman tanpa tampilan yang berdesakan atau terpotong. Kombinasi ini menciptakan pengalaman pengguna yang lebih baik, sekaligus menjaga estetika dan keteraturan antarmuka di seluruh halaman aplikasi.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Dalam desain antarmuka (User Interface Design), warna tema (color theme) berfungsi lebih dari sekadar estetika. Warna menjadi elemen penting dalam branding, emosi pengguna, dan konsistensi visual di seluruh aplikasi.

Pada aplikasi Football Shop (Final Whistle), pemilihan warna bukan dilakukan secara acak, tetapi didesain agar merepresentasikan karakter toko olahraga yang dinamis dan profesional, memudahkan pengguna mengenali identitas merek, dan menciptakan pengalaman visual yang konsisten di setiap halaman aplikasi.

Flutter menggunakan ThemeData untuk mengatur warna dan gaya visual secara global di seluruh aplikasi.
Dengan ThemeData, kita tidak perlu mengatur warna satu per satu — cukup tentukan di root aplikasi (MaterialApp), lalu semua komponen seperti AppBar, Button, dan Drawer akan otomatis mengikuti warna utama brand.

Pada Final Whistle ini terdapat di main.dart sendiri : 
return MaterialApp(
  title: 'Final Whistle',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.indigo, // Warna utama brand
    ).copyWith(
      secondary: Colors.blueAccent, // Warna aksen tambahan
    ),
    scaffoldBackgroundColor: Colors.white,
  ),
  home: const MyHomePage(),
);

Jadi semua halaman dari HomePage hingga ProductForm menggunakan nuansa waena yang sama sehingga pengguna akan langsung merasa bahwa mereka masih di dalam satu aplikasi yang sama. Dimana AppBar akan berwarna indigo di setiap halaman, tombol Save juga dan drawer akan memiliki header berwarna biru dengan teks putih.

Penyesuaikan warna tema di aplikasi Final Whistlesupaya tampilannya konsisten dan sesuai sama identitas brand toko.
Warna utama yang aku pilih adalah indigo, karena warna ini memberikan kesan profesional, elegan, tapi tetap energik — cocok sama suasana dunia sepak bola dan toko olahraga.Aku pakai warna indigo ini secara konsisten di bagian penting seperti AppBar, tombol utama (Save), dan juga header pada Drawer, biar semua halaman punya nuansa yang sama.
Latar belakangnya aku pilih putih supaya kontrasnya bagus dan teks mudah dibaca. Selain itutambahkan sedikit warna biru muda buat aksen, supaya nggak monoton tapi tetap nyatu dengan warna utama.

Dengan cara ini, setiap halaman di aplikasi kelihatan selaras dan pengguna bisa langsung ngenalin brand toko cuma dari warna dan tampilannya — jadi kesannya lebih profesional dan punya identitas visual yang kuat.
