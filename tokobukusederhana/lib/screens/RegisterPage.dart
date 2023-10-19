// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:tokobukusederhana/database/database_helper.dart'; 
import 'package:tokobukusederhana/screens/LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorText = '';

  // Regex untuk memeriksa format email
  final RegExp _emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  void _register() async {
    final email = _emailController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (email.isEmpty || username.isEmpty || password.isEmpty) {
      setState(() {
        _errorText = 'Semua bidang harus diisi';
      });
    } else if (!_emailRegExp.hasMatch(email)) { // Periksa format email
      setState(() {
        _errorText = 'Format email tidak valid';
      });
    } else {
      final user = User(email: email, username: username, password: password);
      final dbHelper = DatabaseHelper.instance;
      final id = await dbHelper.insertUser(user);

      if (id != null) {
        // Registrasi berhasil
        setState(() {
          _errorText = ''; // Hapus pesan kesalahan jika ada
        });

        // Tampilkan notifikasi "Selamat bergabung!"
        final snackBar = SnackBar(
          content: Text('Selamat bergabung!'),
          duration: Duration(seconds: 1), // Durasi notifikasi
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // Navigasi ke halaman LoginPage setelah notifikasi
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
        });
      } else {
        // Gagal menyimpan pengguna ke database
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/register.png', // Ganti dengan path gambar register.jpg
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Daftar dulu yuk!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email harus diisi';
                    } else if (!_emailRegExp.hasMatch(value)) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                _errorText,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: Text('Daftar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text('Sudah punya akun?'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
