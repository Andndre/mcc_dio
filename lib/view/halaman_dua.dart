import 'package:flutter/material.dart';
import 'package:myapp/core/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HalamanDua extends StatelessWidget {
  const HalamanDua({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch data jika belum ada
    Future.microtask(() {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      if (userProvider.users == null) {
        userProvider.fetchUsers();
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Dua'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (userProvider.users == null) {
            return const Center(child: Text('Gagal memuat data pengguna'));
          } else {
            return ListView.builder(
              itemCount: userProvider.users!.length,
              itemBuilder: (context, index) {
                final user = userProvider.users![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
    );
  }
}
