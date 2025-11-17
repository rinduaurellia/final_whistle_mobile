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

====================================== TUGAS 9 ============================================

 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

 Pembuatan model Dart diperlukan karena proses pengambilan dan pengiriman data menggunakan format JSON membutuhkan struktur data yang terdefinisi dengan jelas. Model berfungsi sebagai representasi objek yang sesuai dengan bentuk data yang dikirimkan atau diterima dari backend, sehingga setiap atribut memiliki tipe dan struktur yang konsisten. Dengan adanya model, data dari JSON tidak hanya diterima sebagai informasi mentah, tetapi dipetakan menjadi objek yang lebih mudah digunakan dalam aplikasi Flutter.

Jika data JSON langsung dipetakan menggunakan Map<String, dynamic>, pengembang tidak mendapatkan perlindungan validasi tipe data. Hal ini berpotensi menyebabkan terjadinya kesalahan pada runtime, seperti ketidaksesuaian tipe data, nilai null yang tidak ditangani, atau kesalahan penulisan key-value. Selain itu, karena tidak adanya struktur yang jelas, proses debugging menjadi lebih sulit dan potensi error akan meningkat ketika terjadi perubahan pada format data dari backend.

Model Dart juga membantu menjaga kualitas kode melalui konsep null-safety dan keterbacaan. Dengan adanya model, pengembang dapat memanfaatkan fitur auto-complete dan type checking dari IDE, sehingga meminimalkan kesalahan penulisan dan memudahkan saat melakukan refactoring. Selain itu, model membuat alur data lebih mudah dipahami karena setiap atribut memiliki tipe dan fungsi yang jelas.

Dari sisi maintainability, penggunaan model sangat krusial terutama pada aplikasi berskala besar atau yang terus berkembang. Jika backend mengubah struktur data, pengembang cukup memperbarui model pada satu file tanpa harus memperbaiki banyak bagian kode yang memanfaatkan data tersebut. Sebaliknya, jika hanya menggunakan map, perubahan struktur data memerlukan pengecekan dan perbaikan secara manual di seluruh bagian aplikasi yang menggunakan data tersebut, sehingga meningkatkan risiko error serta menambah waktu perbaikan.

 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Fungsi Package HTTP : 
Package http adalah paket dasar Flutter yang digunakan untuk melakukan komunikasi dengan server menggunakan protokol HTTP. Fungsi-fungsinya mencakup:
1) Melakukan request HTTP seperti GET, POST, PUT, dan DELETE.
2) Mengirim dan menerima data berupa JSON, text, atau file.
3) Tidak menyimpan session atau cookie secara otomatis.
4) Tidak menangani otentikasi berbasis session/cookie secara built-in.
Dengan kata lain, package http sangat berguna untuk API yang tidak membutuhkan login, seperti pengambilan data publik, testing endpoint, atau akses API berbasis token.

Fungsi Package CookieRequest : 
CookieRequest berasal dari package pbp_django_auth, yang dirancang khusus untuk menghubungkan Flutter dengan Django Authentication System. Fungsi-fungsinya dalam tugas ini adalah:
1) Mengelola session login secara otomatis menggunakan cookie.
2) Menyimpan dan mengirim cookie otentikasi di setiap request yang membutuhkan akses user.
3) Memungkinkan penggunaan endpoint Django yang dilindungi login_required.
4) Menyediakan fungsi login, register, dan logout agar Flutter tetap terhubung dengan django user session.

Package http dalam Flutter berfungsi sebagai alat komunikasi dasar antara aplikasi dan server menggunakan protokol HTTP. Paket ini memungkinkan aplikasi untuk melakukan permintaan seperti GET, POST, PUT, dan DELETE, serta menerima respons dalam berbagai format seperti JSON atau teks. Namun, http tidak menyediakan fitur penyimpanan cookie dan tidak dapat menangani autentikasi berbasis sesi secara otomatis. Dengan demikian, paket http lebih cocok digunakan untuk mengambil data publik, mengakses API tanpa autentikasi, atau melakukan pengujian endpoint yang tidak memerlukan identitas pengguna.

Berbeda dengan itu, CookieRequest yang berasal dari package pbp_django_auth, dirancang khusus agar Flutter dapat berinteraksi dengan sistem autentikasi Django. CookieRequest menyimpan dan mengirim cookie autentikasi secara otomatis pada setiap permintaan yang dilakukan, sehingga server dapat mengenali pengguna yang sedang login. Hal ini memungkinkan Flutter mengakses endpoint Django yang dilindungi oleh decorator seperti login_required, serta mendukung proses login, register, dan logout dengan cara yang aman dan sesuai standar autentikasi berbasis sesi. Dengan kata lain, CookieRequest sangat diperlukan untuk mengelola fitur aplikasi yang bersifat user-specific, seperti menyimpan produk berdasarkan akun pengguna.

Jika dibandingkan, perbedaan mendasar antara keduanya terletak pada mekanisme autentikasi dan pengelolaan sesi. http hanya berfungsi sebagai alat komunikasi tanpa konteks identitas pengguna, sedangkan CookieRequest membawa identitas autentikasi sehingga server dapat menentukan apakah pengguna berhak mengakses suatu resource. Oleh karena itu, pemilihan paket yang tepat bergantung pada kebutuhan: http untuk request umum tanpa autentikasi dan CookieRequest untuk seluruh fitur yang membutuhkan status login.

Secara keseluruhan, keberadaan CookieRequest dalam tugas ini sangatlah penting karena aplikasi membutuhkan autentikasi agar fitur seperti menampilkan produk milik pengguna, menambah data, atau mengakses informasi yang dilindungi dapat berjalan dengan aman dan efisien. Tanpa CookieRequest, aplikasi tidak akan mampu mempertahankan sesi login sehingga fitur berbasis user akan gagal dijalankan atau memerlukan mekanisme autentikasi manual yang jauh lebih kompleks untuk diimplementasikan.

Dalam tugas ini, package http berfungsi sebagai alat komunikasi dasar dengan server, namun tidak mengelola session dan autentikasi. Oleh karena itu, ketika aplikasi membutuhkan fitur login dan pemanggilan data yang terikat user, maka digunakan CookieRequest karena mampu menyimpan dan mengelola cookie session, memudahkan proses login, serta mengakses endpoint Django yang memerlukan autentikasi. Penggunaan CookieRequest memastikan komunikasi Flutter dan Django berlangsung lebih aman, terstruktur, dan sesuai dengan sistem login yang telah ditentukan sehingga fitur seperti menambahkan produk, melihat produk pribadi, dan logout dapat berfungsi dengan baik.

 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance CookieRequest perlu dibagikan ke seluruh komponen dalam aplikasi Flutter karena objek ini menyimpan informasi autentikasi dan sesi pengguna, termasuk cookie login yang diperoleh setelah proses autentikasi berhasil. Jika CookieRequest hanya dibuat pada satu widget saja tanpa dibagikan secara global melalui mekanisme state management seperti Provider, maka informasi sesi tidak akan tersinkronisasi antar halaman. Akibatnya, pengguna yang sudah login pada halaman tertentu dapat dianggap belum login ketika mengakses halaman lain, sehingga request ke endpoint Django yang memerlukan autentikasi akan ditolak oleh server.

Selain itu, CookieRequest berfungsi sebagai representasi status login dalam keseluruhan aplikasi. Dengan membagikan instance yang sama, setiap halaman dapat dengan mudah memeriksa apakah pengguna sedang dalam keadaan login atau logout, serta melakukan tindakan yang sesuai, seperti menampilkan data pribadi, menambah produk, atau membatasi akses ke halaman tertentu. Hal ini juga memastikan bahwa setiap request yang dikirimkan ke Django akan dilengkapi cookie yang valid, sehingga data yang dikirim dan diterima selalu sesuai dengan identitas pengguna yang sedang aktif.

Pendekatan sharing instance seperti ini juga meningkatkan efisiensi dan maintainability aplikasi. Alih-alih membuat instance CookieRequest berkali-kali di berbagai halaman, aplikasi cukup menginisialisasikannya satu kali di root widget, lalu membagikannya dengan pattern dependency injection. Dengan demikian, manajemen autentikasi menjadi lebih stabil, konsisten, dan terhindar dari bug seperti request tidak terotorisasi atau kehilangan sesi pengguna secara tiba-tiba.

 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

 Agar aplikasi Flutter bisa berkomunikasi dengan server Django, ada beberapa konfigurasi yang perlu dilakukan baik di sisi backend maupun aplikasi. Pertama, kita harus menambahkan 10.0.2.2 ke dalam ALLOWED_HOSTS pada Django. Hal ini karena ketika menggunakan emulator Android, alamat localhost tidak menunjuk ke komputer kita, tetapi ke lingkungan emulator itu sendiri. Oleh karena itu, 10.0.2.2 digunakan sebagai jembatan agar Flutter dapat mengakses server Django melalui komputer kita. Kalau ini tidak ditambahkan, request dari Flutter akan dianggap tidak valid dan otomatis ditolak oleh Django.

Selain itu, kita perlu mengaktifkan CORS (Cross-Origin Resource Sharing) di Django. CORS penting agar server mau menerima request yang berasal dari domain atau port yang berbeda, termasuk dari aplikasi Flutter. Kita juga perlu mengatur konfigurasi cookie, terutama bagian SameSite, supaya cookie yang berisi session user dapat dikirim dari Flutter. Jika tidak diatur, proses login tidak akan berfungsi meskipun username dan password sudah benar, karena session tidak terbaca oleh server.

Kemudian, dari sisi Flutter, kita juga wajib menambahkan izin akses internet pada AndroidManifest.xml dengan <uses-permission android:name="android.permission.INTERNET"/>. Tanpa izin ini, aplikasi tidak akan bisa mengirim request ke internet atau server sehingga fitur tidak dapat berjalan seperti seharusnya.

Jika konfigurasi tersebut tidak dilakukan dengan benar, maka beberapa masalah akan muncul, seperti data gagal ditampilkan, proses login dianggap gagal terus, request dianggap berbahaya atau ditolak oleh server, dan secara keseluruhan aplikasi tidak bisa berfungsi sebagai aplikasi berbasis client-server.

 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

 Proses pengiriman data dari input hingga dapat ditampilkan kembali di Flutter melalui mekanisme client–server. Pertama, pengguna memasukkan data melalui form di aplikasi Flutter, misalnya form pembuatan produk. Data tersebut akan disimpan sementara dalam variabel state dan divalidasi agar sesuai tipe dan ketentuan. Setelah valid, data dikirim ke backend Django melalui HTTP request (misalnya menggunakan postJson() dari CookieRequest). Pada tahap ini, data dikirim dalam format JSON agar mudah dibaca dan diproses oleh server.

Setelah server Django menerima request, data tersebut diproses melalui view yang sudah dibuat, seperti create_product_flutter. Di dalam view tersebut, Django akan melakukan parsing dan sanitasi input (strip_tags), memvalidasi, dan menyimpannya ke database melalui model Product. Jika data berhasil disimpan, Django akan mengembalikan response dalam bentuk JSON sebagai tanda keberhasilan.

Ketika Flutter ingin menampilkan data, Flutter akan melakukan HTTP GET request melalui endpoint JSON, misalnya http://localhost:8000/my-products-json/. Django kemudian akan mengirim daftar data produk dalam JSON. Flutter menerima response tersebut, memparsingnya menjadi model Dart (misalnya ProductEntry) agar datanya memiliki struktur, tipe variabel yang jelas, dan aman untuk digunakan di UI.

Terakhir, data yang telah dikonversi ke objek model akan ditampilkan melalui widget seperti ListView.builder() dan ProductEntryCard. Dengan alur ini, data yang awalnya berasal dari input pengguna dapat tersimpan di database dan ditampilkan kembali secara real-time melalui aplikasi Flutter.

 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Proses autentikasi pada aplikasi ini berjalan mulai dari proses register, login, hingga logout dengan memanfaatkan komunikasi antara Flutter sebagai client dan Django sebagai server. Pada proses register, pengguna mengisi data akun berupa username dan password melalui form di Flutter. Data tersebut kemudian dikirim melalui HTTP POST ke Django menggunakan endpoint register_ajax atau endpoint standar Django (/auth/register/). Django akan memvalidasi data menggunakan UserCreationForm, memastikan username tidak duplikat serta password memenuhi aturan keamanan. Jika valid, akun baru akan dibuat dan data tersimpan di database. Jika tidak valid, Django akan mengembalikan pesan error dan Flutter akan menampilkannya ke pengguna.

Pada proses login, pengguna memasukkan username dan password pada aplikasi Flutter. Data ini dikirim ke Django menggunakan request.login() dari CookieRequest menuju endpoint /auth/login/. Django kemudian memverifikasi kredensial menggunakan fungsi authenticate(). Jika cocok, Django menjalankan login(request, user) yang sekaligus membuat dan menyimpan session serta cookie untuk user tersebut. Informasi session login inilah yang nantinya dipakai Flutter untuk mengakses endpoint yang membutuhkan login, karena CookieRequest akan otomatis menyertakan cookie pada setiap request berikutnya. Jika login gagal, Django akan mengirimkan respons berisi pesan kesalahan yang ditampilkan kembali di Flutter.

Setelah berhasil login, Flutter akan mengenali bahwa status autentikasi bernilai true melalui request.loggedIn, dan aplikasi akan diarahkan menuju halaman utama (misalnya MyHomePage). Selama user masih dalam keadaan login, Flutter dapat melakukan request ke endpoint Django yang membutuhkan autentikasi, contohnya saat mengirim produk melalui create_product_flutter atau saat mengambil data produk spesifik milik user melalui endpoint /my-products-json/.

Proses logout dilakukan ketika pengguna menekan tombol logout di Flutter. Aplikasi akan mengirim permintaan ke Django melalui endpoint /auth/logout/ atau logout_ajax. Django kemudian menjalankan fungsi logout(request) yang menghapus session dan cookie login. Setelah itu, Django mengirimkan pesan bahwa user berhasil logout. Flutter kemudian mengarahkan user kembali ke halaman login dan status autentikasi di CookieRequest berubah menjadi false, sehingga user tidak dapat mengakses halaman yang membutuhkan autentikasi sebelum login kembali.

 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

1) Membuat dan Menyiapkan Model di Flutter

Pertama, saya memastikan bahwa data JSON dari Django dapat dipetakan dengan benar ke dalam objek Dart. Saya memulai dengan membuka endpoint JSON yang sudah saya buat pada Django, lalu menyalin contoh data tersebut dan memanfaatkan Quicktype untuk menghasilkan kelas model secara otomatis. Hasil dari Quicktype kemudian saya tempelkan pada file model dalam folder /lib/models/.

class ProductEntry {
    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
    });

    int id;
    String name;
    int price;
    String description;

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
    };
}

2) Menambahkan Dependensi dan Melakukan Konfigurasi Konektivitas
Selanjutnya, saya menambahkan package yang dibutuhkan untuk melakukan komunikasi antara Flutter dan Django, seperti:
flutter pub add http
flutter pub add provider
flutter pub add pbp_django_auth

Di Django, saya melakukan beberapa konfigurasi penting pada settings.py agar session dan cookie dapat berjalan serta request dari Flutter tidak ditolak oleh CORS. Beberapa pengaturan yang saya tambahkan adalah:
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'

ALLOWED_HOSTS = ["localhost", "127.0.0.1", "10.0.2.2"]
Saya juga menambahkan permission internet pada Flutter melalui file AndroidManifest.xml:
<uses-permission android:name="android.permission.INTERNET" />

3. Implementasi Fitur Autentikasi (Login, Register, Logout)
Saya menambahkan view Django untuk login, register, dan logout di dalam authentication/views.py, misalnya untuk login:
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        auth_login(request, user)
        return JsonResponse({
            "username": user.username,
            "status": True,
            "message": "Login successful!"
        }, status=200)
    return JsonResponse({"status": False, "message": "Invalid credentials"}, status=401)

Di Flutter, saya menggunakan CookieRequest sebagai session handler yang dimasukkan melalui Provider ke seluruh widget:
return Provider(
  create: (_) => CookieRequest(),
  child: MaterialApp(
    home: const LoginPage(),
  ),
);
Jika login berhasil, saya melakukan routing menggunakan Navigator.pushReplacement() agar halaman login tidak bisa kembali menggunakan tombol back.

4. Fetch & Display Data dari Django dan Mengirim Data melalui Form Flutter
Untuk menampilkan list data dari Django, saya membuat fungsi fetch menggunakan Future dan menampilkan datanya melalui FutureBuilder.
Future<List<ProductEntry>> fetchMyProducts(CookieRequest request) async {
  final response = await request.get("http://10.0.2.2:8000/my-products-json/");
  return response.map<ProductEntry>((d) => ProductEntry.fromJson(d)).toList();
}

Kemudian saya tampilkan menggunakan widget:
return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (_, index) => ProductEntryCard(product: snapshot.data![index]),
);

Untuk mengirim data (POST) dari form Flutter saya menggunakan:
await request.postJson(
  "http://10.0.2.2:8000/create-product/",
  jsonEncode({
    "name": _name,
    "price": _price,
    "description": _description,
    brand, jenis dll
  }),
);
Jika berhasil, saya menampilkan snackbar dan mengembalikan halaman ke home.
