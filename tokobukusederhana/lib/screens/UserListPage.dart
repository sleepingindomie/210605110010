import 'package:flutter/material.dart';
import 'package:tokobukusederhana/database/database_helper.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late Future<List<User>> _userList;

  @override
  void initState() {
    super.initState();
    _userList = _loadUserList();
  }

  Future<List<User>> _loadUserList() async {
    final dbHelper = DatabaseHelper.instance;
    final userList = await dbHelper.getAllUsers();
    return userList;
  }

  Future<void> _deleteUser(int userId) async {
    final dbHelper = DatabaseHelper.instance;
    final rowsDeleted = await dbHelper.deleteUser(userId);

    if (rowsDeleted > 0) {
      // Data pengguna berhasil dihapus dari database
      // Refresh daftar pengguna
      setState(() {
        _userList = _loadUserList();
      });
    } else {
      // Gagal menghapus data pengguna dari database
      // Tampilkan pesan kesalahan jika perlu
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pengguna'),
      ),
      body: FutureBuilder<List<User>>(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data pengguna.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  title: Text('Username: ${user.username}'),
                  subtitle: Text('Email: ${user.email}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Panggil metode _deleteUser untuk menghapus pengguna
                      _deleteUser(user.id!);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
