import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 16.0),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Tempat Favorit 1'),
            subtitle: const Text('Deskripsi tempat favorit 1'),
            onTap: () {
              // Tambahkan navigasi ke halaman detail tempat favorit 1
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Tempat Favorit 2'),
            subtitle: const Text('Deskripsi tempat favorit 2'),
            onTap: () {
              // Tambahkan navigasi ke halaman detail tempat favorit 2
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Tempat Favorit 3'),
            subtitle: const Text('Deskripsi tempat favorit 3'),
            onTap: () {
              // Tambahkan navigasi ke halaman detail tempat favorit 3
            },
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
