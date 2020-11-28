import 'package:flutter/material.dart';

class HandlingError2 extends StatefulWidget {
  @override
  _HandlingError2State createState() => _HandlingError2State();
}

class _HandlingError2State extends State<HandlingError2> {

  String selectedItem;

  List<String> jenisKelamin = ["Laki-Laki", "Perempuan"];

  void changeRadio(String item){
    setState(() {
      selectedItem = item;
    });
  }

  void _showSnackbar(String message){
    final snackbar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text(message),
    );
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void _showDialog(){
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("jenis kelamin kamu"),
        content: Text(selectedItem),
        actions: [
          FlatButton(
            child: Text("Ok"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .3,
            child: Column(
              children: jenisKelamin.map((e){
                return RadioListTile(
                  value: e,
                  groupValue: selectedItem,
                  onChanged: (val){
                    changeRadio(val);
                    print(val);
                  },
                  title: Text(e),
                );
              }).toList(),
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width * .3,
            padding: EdgeInsets.only(top: 20),
            child: FlatButton(
              onPressed: (){
                if(selectedItem != null){
                  _showDialog();
                }else{
                  _showSnackbar("Mohon Memilih Jenis Kelamin");
                }
              },
              color: Colors.blue,
              child: Text("Submit", style: TextStyle(
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }
}