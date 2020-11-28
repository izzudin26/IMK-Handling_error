import 'package:flutter/material.dart';
import 'HandlingError1.dart';
import 'HandlingError2.dart';
import 'HandlingError3.dart';
import 'HandlingError4.dart';
import 'Handlingerror5.dart';

class NavigatorPage extends StatefulWidget {
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {

  List<Widget> page = [HandlingError1(), HandlingError2(), HandlingError3(), HandlingError4(), HandlingError5()];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Handling Error IMK IZZUDIN AR RAFIQ (111910024)"),
        centerTitle: true,
      ),
      body: page[currentPage],
      bottomNavigationBar: BottomNavigator(),
    );
  }

  Widget BottomNavigator(){
    return BottomNavigationBar(
      currentIndex: currentPage,
      onTap: (int index){
        setState(() {
          currentPage = index;
        });
      },
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.error),
          title: Text("Error 1")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.error),
          title: Text("Error 2")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.error),
          title: Text("Error 3")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.error),
          title: Text("Error 4")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.error),
          title: Text("Error 5")
        )
      ],
    );
  }
}