import 'package:flutter/material.dart';

class HandlingError4 extends StatefulWidget {
  @override
  _HandlingError4State createState() => _HandlingError4State();
}

class _HandlingError4State extends State<HandlingError4> {

  TextEditingController number = new TextEditingController(text: "0");

  void increment(){
    int parseNumber = int.parse(number.text);
    setState(() {
      parseNumber += 1;
      number.text = parseNumber.toString();
    });
  }

  void decrement(){
    int parseNumber = int.parse(number.text);
    setState(() {
      parseNumber -= 1;
      number.text = parseNumber.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .2,
                  child: TextField(
                    readOnly: true,
                    controller: number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              suffixIcon: FlatButton(
                onPressed: increment,
                child: Text("+"),
              ),
              prefixIcon: FlatButton(
                onPressed: decrement,
                child: Text("-"),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ),
          ),
        ),
      ),
    );
  }
}