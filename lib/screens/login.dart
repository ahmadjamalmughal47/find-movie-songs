import 'package:flutter/material.dart';
import './search.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text("Login"),
        ),
        body: Center(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "don't leave it blank";
                    }
                    return null;
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Enter username",
                      contentPadding: EdgeInsets.all(20.0),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal))),
                ),
              ),
              Expanded(
                flex: 0,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "don't leave it blank";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Enter password",
                      contentPadding: EdgeInsets.all(20.0),
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal))),
                ),
              ),
              Expanded(
                flex: 0,
                child: ElevatedButton(
                  child: Text(
                    "Login",
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: TextButton(
                  child: Text("Not a member? Sign up!"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Signup"),
                              content: SignupDialog(),
                            ));
                  },
                ),
              )
            ],
          ),
        )));
  }
}

class SignupDialog extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "don't leave it blank";
                }
                return null;
              },
              autofocus: true,
              controller: userNameController,
              decoration: InputDecoration(
                  labelText: "Enter Username",
                  contentPadding: EdgeInsets.all(20.0),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal))),
            ),
          ),
          Expanded(
            flex: 0,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "don't leave it blank";
                }
                return null;
              },
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Enter password",
                  contentPadding: EdgeInsets.all(20.0),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal))),
            ),
          ),
          Expanded(
            flex: 0,
            child: ElevatedButton(
              child: Text(
                "Signup",
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pop(
                      context, [userNameController, passwordController]);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Account Created')));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// expanded, flex:0, solved the issue for this layout.
