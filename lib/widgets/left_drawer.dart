import 'package:flutter/material.dart';
import 'package:final_whistle_mobile/screens/menu.dart'; 
import 'package:final_whistle_mobile/screens/productlist_form.dart'; 

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // Bagian drawer header
             decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  'Final Whistle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Find the best football product here!",
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontSize: 15,               
                    color: Colors.white,        
                    fontWeight: FontWeight.normal, 
                  ),
                ),
              ],
            ),
          ),
          // Bagian routing
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
          ListTile(
            leading: const Icon(Icons.post_add),
            title: const Text('Add Product'),
            // Bagian redirection ke ProductForm Page
            onTap: () {
               Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  // routing ke Product Form Page
                  builder: (context) => ProductFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}