import 'package:flutter/material.dart';

class NoDioProvider extends StatelessWidget {
  const NoDioProvider({super.key});

  // Data pengguna statis
  final List<Map<String, String>> users = const [
    {
      "id": "1",
      "first_name": "John",
      "last_name": "Doe",
      "email": "johndoe@example.com",
      "avatar": "https://i.pravatar.cc/150?img=1"
    },
    {
      "id": "2",
      "first_name": "Jane",
      "last_name": "Smith",
      "email": "janesmith@example.com",
      "avatar": "https://i.pravatar.cc/150?img=2"
    },
    {
      "id": "3",
      "first_name": "Alice",
      "last_name": "Johnson",
      "email": "alicej@example.com",
      "avatar": "https://i.pravatar.cc/150?img=3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user['avatar']!),
          ),
          title: Text('${user['first_name']} ${user['last_name']}'),
          subtitle: Text(user['email']!),
        );
      },
    );
  }
}
