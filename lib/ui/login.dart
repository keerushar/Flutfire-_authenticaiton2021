import 'package:flutfire/utils/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? _emailController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                "Sign In ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    hintText: "Enter your email",
                  )),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Enter your password",
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_emailController!.text.isEmpty ||
                      _passwordController!.text.isEmpty) {
                    print("Enter your email and password");
                    return;
                  }

                  bool res = await AuthProvider().signInWithEmail(
                      _emailController!.text, _passwordController!.text);
                  if (!res) {
                    print("login failed");
                  }
                },
                child: Text("Login"),
              ),
              Text("OR"),
              ElevatedButton(
                onPressed: () async {
                  bool res = await AuthProvider().loginWithGoogle();
                  if (!res) {
                    print("not signin");
                  }
                },
                child: Text("Sign in with Google"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
