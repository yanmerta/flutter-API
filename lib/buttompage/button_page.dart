import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home'),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Search'),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Library'),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('About'),
    );
  }
}

class PageProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }
}

class BottomNavigationBarExample extends StatelessWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = PageProvider();

    return ChangeNotifierProvider<PageProvider>.value(
      value: pageProvider,
      child: Scaffold(
        body: Consumer<PageProvider>(
          builder: (context, value, child) {
            switch (value.currentPage) {
              case 0:
                return const HomePage();
              case 1:
                return const SearchPage();
              case 2:
                return const LibraryPage();
              case 3:
                return const AboutPage();
              default:
                return const HomePage();
            }
          },
        ),
        bottomNavigationBar: Consumer<PageProvider>(
          builder: (context, value, child) {
            return BottomNavigationBar(
              currentIndex: value.currentPage,
              onTap: (index) {
                value.currentPage = index;
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_books),
                  label: 'Library',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
