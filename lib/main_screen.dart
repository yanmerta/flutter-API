import 'package:flutter/material.dart';
import 'package:wisata/UI/testapi.dart';
import 'package:wisata/buttompage/Favorite_page.dart';
import 'package:wisata/buttompage/ProfilPage.dart';
import 'package:wisata/detail_screen.dart';
import 'package:wisata/drawer/bantuan_page.dart';
import 'package:wisata/drawer/profil_page.dart';
import 'package:wisata/drawer/setting_page.dart';
import 'package:wisata/model/wisata.dart';
import 'package:wisata/pages/login_page.dart';
import 'package:wisata/pages/products.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My App'),
            backgroundColor: Colors.black.withOpacity(0.8),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black),
                  accountName: Text('Wayan Merta'),
                  accountEmail: Text('wayan0468@gmail.com'),
                  currentAccountPicture: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProfilPage(imageUrl: 'images/merta.jpg')),
                      );
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/merta.jpg'),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Setting',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingPage()));
                    // navigate to home screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.manage_accounts),
                  title: Text(
                    'Profil Saya',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profilpage()));
                    // navigate to settings screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text(
                    'Bantuan',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BantuanPage()));
                    // navigate to home screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.propane),
                  title: Text(
                    'Pesanan Tiket',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProductPage()));
                    // navigate to home screen
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    // perform logout action
                  },
                ),
              ],
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth <= 600) {
                return const TourismPlaceList();
              } else if (constraints.maxWidth <= 1200) {
                return const WisataGrid(gridCount: 4);
              } else {
                return const WisataGrid(gridCount: 6);
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            selectedItemColor: Colors.blue,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorit',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
            ],
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(
                              title: '',
                            )),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilPage(
                              imageUrl: '',
                            )),
                  );
                  break;
              }
            },
          ),
        );
      },
    );
  }
}

class WisataGrid extends StatelessWidget {
  final int gridCount;

  const WisataGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: wisataList.map((place) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      place.imageAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      place.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      place.location,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Wisata place = wisataList[0];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Image.asset(place.imageAsset),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            place.name,
                            style:
                                TextStyle(color: Colors.blue, fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: wisataList.length,
      ),
    );
  }
}
