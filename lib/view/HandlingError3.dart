import 'package:flutter/material.dart';

class HandlingError3 extends StatefulWidget {
  @override
  _HandlingError3State createState() => _HandlingError3State();
}

class _HandlingError3State extends State<HandlingError3> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController email = new TextEditingController();

  String emailValidator(String value) {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return "Masukan Email dengan benar";
    } else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email",
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      email.text = "";
                    });
                  },
                  icon: Icon(Icons.close),
                )
                ),
                controller: email,
                validator: emailValidator,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      _formkey.currentState.validate();
                    },
                    child:
                        Text("Submit", style: TextStyle(color: Colors.white)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
