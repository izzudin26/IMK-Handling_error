import 'package:flutter/material.dart';

class User {
  String username;
  String password;
  User({this.username, this.password});
}

class HandlingError5 extends StatefulWidget {
  @override
  _HandlingError5State createState() => _HandlingError5State();
}

class _HandlingError5State extends State<HandlingError5> {
  List<User> users = [
    User(username: "admin", password: "admin"),
    User(username: "user", password: "user")
  ];

  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool isShowPassword = false;
  final globalForm = GlobalKey<FormState>();

  String usernameValidator(String value) {
    if (value == null || value == "") {
      return "Mohon mengisi username";
    }
    return null;
  }

  String passwordValidator(String value) {
    if (value == "" || value == null) {
      return "Mohon mengisi password";
    }
    return null;
  }

  void showsnackbar(String message) {
    final snackbar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void loginValidator() {
    print("hit login");
    List<User> filterUser = users.where(
        (e) => e.username == username.text && e.password == password.text).toList();
    if (filterUser.length != 0) {
      showsnackbar("Sukses Login menggunakan ${filterUser[0].username}");
    }else{
      showsnackbar("Username dan Password tidak terdaftar");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * .4,
        child: Form(
          key: globalForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: usernameValidator,
                controller: username,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.people),
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  validator: passwordValidator,
                  controller: password,
                  obscureText: !isShowPassword,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: IconButton(
                        color: isShowPassword ? Colors.blue : Colors.grey,
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            isShowPassword = !isShowPassword;
                          });
                        },
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (globalForm.currentState.validate()) {
                        print("oke");
                        loginValidator();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
