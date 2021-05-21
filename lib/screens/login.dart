import 'package:flutter/material.dart';
import './search.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text("Login"),
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(
              flex: 0,
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "Like jordanpeterson123",
                    labelText: "Enter username",
                    contentPadding: EdgeInsets.all(20.0),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal))),
              ),
            ),
            Expanded(
              flex: 0,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "like kausarshahzadi123",
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
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
        )));
  }
}

class SignupDialog extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 0,
          child: TextField(
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
          child: TextField(
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
              Navigator.pop(context, [userNameController, passwordController]);
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("Account Created"),
                        content: Column(
                          children: [
                            Text("Username: " + userNameController.text),
                            Text("Password: " + passwordController.text),
                          ],
                        ),
                      ));
            },
          ),
        ),
      ],
    );
  }
}

// expanded, flex:0, solved the issue for this layout.
