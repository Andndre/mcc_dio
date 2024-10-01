import 'package:flutter/material.dart';
import 'package:myapp/view/dio_only.dart';
import 'package:myapp/view/with_provider.dart';
import 'package:myapp/view/no_dio_provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // Index untuk menentukan halaman yang sedang aktif
  int _selectedPageIndex = 0;

  // List halaman yang dapat ditampilkan
  final List<Widget> _pages = [
    const NoDioProvider(),
    const DioOnly(),
    const WithProvider(),
  ];

  // Fungsi untuk mengganti halaman yang sedang aktif
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.pop(context); // Menutup Drawer setelah memilih halaman
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0
            ? 'Tanpa Dio & Provider'
            : _selectedPageIndex == 1
                ? 'Tanpa Provider'
                : 'Dio + Provider'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Tanpa Dio & Provider'),
              onTap: () => _selectPage(0),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Tanpa Provider'),
              onTap: () => _selectPage(1),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Dio + Provider'),
              onTap: () => _selectPage(2),
            ),
          ],
        ),
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
