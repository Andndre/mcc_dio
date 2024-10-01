import 'package:flutter/material.dart';
import 'package:myapp/core/model/user_model.dart';
import 'package:myapp/core/service/user_service.dart';

class DioOnly extends StatefulWidget {
  const DioOnly({super.key});

  @override
  State<DioOnly> createState() => _DioOnlyState();
}

class _DioOnlyState extends State<DioOnly> {
  final UserService _userService = UserService(); // Inisialisasi UserService

  late Future<List<UserModel>> _futureUsers; // Future untuk data pengguna

  @override
  void initState() {
    super.initState();
    _futureUsers = _userService.getUser(); // Memuat data pengguna di initState
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: _futureUsers, // Menggunakan Future dari _userService
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Menampilkan loader saat data sedang dimuat
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Menampilkan pesan jika terjadi error
          return const Center(child: Text('Gagal memuat data pengguna.'));
        } else if (snapshot.hasData) {
          // Menampilkan list pengguna jika data berhasil dimuat
          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              );
            },
          );
        } else {
          return const Center(child: Text('Tidak ada data pengguna.'));
        }
      },
    );
  }
}
