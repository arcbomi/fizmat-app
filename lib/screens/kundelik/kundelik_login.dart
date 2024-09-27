import 'package:fizmat_app/providers/kundelik/kundelik_auth.dart';
import 'package:fizmat_app/screens/kundelik/kundelik.dart';
import 'package:flutter/material.dart';

class FizKunLogin extends StatefulWidget {
  @override
  _FizKunLoginState createState() => _FizKunLoginState();
}

class _FizKunLoginState extends State<FizKunLogin> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Handle login logic here
    print('Username: $username');
    print('Password: $password');

    String kundelikToken = "ERROR TOKEN";

    try {
      kundelikToken = await KunBase().getToken(username, password);
        print('Token: $kundelikToken');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Logged in with Token: $kundelikToken'),
          ),
        );

        // Navigate to TokenDisplayPage with the token
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => GetInfoScreen(token: kundelikToken),
          ),
        );
    } catch (e) {
      // Handle errors (e.g., invalid credentials)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: ${e.toString()}'),
        ),
      );
    }

    final kunAPI = KunAPI(token: kundelikToken);

    try {
      final userInfo = await kunAPI.getInfo();
      print("User Info: $userInfo");
    } catch (e) {
      print("Error fetching user info: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Kundelik Login',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


