import 'package:flutter/material.dart';

class HandlingError1 extends StatefulWidget {
  @override
  _HandlingError1State createState() => _HandlingError1State();
}

class _HandlingError1State extends State<HandlingError1> {
  TextEditingController name = new TextEditingController();

  final formKey = GlobalKey<FormState>();

  String nameValidator(String value){
    if(value == ""){
      return "Mohon mengisi nama lengkap";
    }else if(value.length < 5){
      return "Nama harus berisi 5 karakter lebih";
    }

    return null;
  }

  void _showDialog(){
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("namamu"),
        content: Text(name.text,
      ),
      actions: [
        FlatButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: TextFormField(
                  validator: nameValidator,
                  controller: name,
                  decoration: InputDecoration(
                      labelText: "Nama",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        if(formKey.currentState.validate()){
                          _showDialog();
                        }
                      },
                      child:
                          Text("Submit", style: TextStyle(color: Colors.white)),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
