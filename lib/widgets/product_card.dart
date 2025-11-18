import 'package:flutter/material.dart';
import 'package:final_whistle_mobile/screens/menu.dart'; 
import 'package:final_whistle_mobile/screens/productlist_form.dart'; 
import 'package:final_whistle_mobile/screens/product_entry_list.dart';
import 'package:final_whistle_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:final_whistle_mobile/widgets/product_mylist.dart';


class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 

  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () async{
        // Memunculkan SnackBar ketika diklik
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!")));

        // Navigate ke route yang sesuai (tergantung jenis tombol)
        if (item.name == "Create Product") {
         Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductFormPage()),
            );
          } // Add this condition in your onTap handler
          else if (item.name.toLowerCase().contains("my product")) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyProductListPage(),
              ),
            );
          } else if (item.name == "Logout") {
                // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                // If you using chrome,  use URL http://localhost:8000
                final response = await request.logout(
                    "http://localhost:8000/auth/logout/");
                String message = response["message"];
                if (context.mounted) {
                    if (response['status']) {
                        String uname = response["username"];
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("$message See you again, $uname."),
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
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
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