import 'package:flutter/material.dart';
import 'package:tokobukusederhana/screens/Home.dart';
import 'package:tokobukusederhana/screens/LandingPage.dart';
import 'package:tokobukusederhana/screens/RegisterPage.dart';
import 'package:tokobukusederhana/screens/UserListPage.dart';
import 'package:tokobukusederhana/database/database_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorText = '';

  void _handleLoginSuccess(BuildContext context, String username) {
    // Lakukan logika untuk login yang berhasil di sini, misalnya menyimpan informasi pengguna.
    // Setelah berhasil login, set isLoggedIn ke true dan loggedInUsername ke username.
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LandingPage(
        isLoggedIn: true,
        loggedInUsername: username,
      ),
    ));
  }

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _errorText = 'Semua bidang harus diisi';
      });
    } else {
      final dbHelper = DatabaseHelper.instance;
      final isUserAuthenticated = await dbHelper.authenticateUser(username, password);

      if (isUserAuthenticated) {
        // Autentikasi sukses, arahkan ke LandingPage dengan informasi pengguna
        _handleLoginSuccess(context, username);
      } else {
        // Autentikasi gagal, tampilkan pesan kesalahan
        setState(() {
          _errorText = 'Username atau password salah';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/login.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
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
                onPressed: _login,
                child: Text('Login'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text('Buat Akun Baru'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserListPage()));
                },
                child: Text('Lihat Daftar Pengguna'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
