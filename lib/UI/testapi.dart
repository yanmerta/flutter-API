import 'package:flutter/material.dart';
import 'package:wisata/model/wisata2.dart';
import 'package:wisata/services/apiStatic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Wisata> _posts = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Wisata> posts = await ApiStatic.getwisata();
      setState(() {
        _posts = posts;
        _isLoading = false;
      });
    } catch (e) {
      print('Failed to fetch posts: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshPosts() async {
    await fetchPosts();
  }

  void _navigateToDetail(Wisata wisata) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(wisata: wisata),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.8),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: _refreshPosts,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (BuildContext context, int index) {
                  Wisata wisata = _posts[index];
                  return ListTile(
                    title: Text(wisata.nama),
                    subtitle: Text(wisata.alamat),
                    leading: Image.network(
                        "data:image/jpeg;base64,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"),
                    trailing: Icon(
                      Icons.info,
                      color: Colors.red,
                    ),
                    onTap: () => _navigateToDetail(wisata),
                  );
                },
              ),
            ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Wisata wisata;

  const DetailPage({Key? key, required this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/0/09/Logo_undiksha.png"),
          SizedBox(height: 16),
          Text(
            wisata.alamat,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            wisata.telp,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
