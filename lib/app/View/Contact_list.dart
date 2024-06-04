import 'package:agenda_crud_flutterr/app/my_app.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
final lista = [
  {"nome:",'Ana', 'telefone:''(22)96060-7070',"'avatar':"'https://cdn.pixabay.com/photo/2017/01/31/19/07/avatar-2026510_1280.png'},
  {"nome:"'Julia', 'telefone:''(44)9921-1239',"'avatar':"'https://cdn.pixabay.com/photo/2017/03/01/22/18/avatar-2109804_1280.png'},
  {"nome:"'Juninho', 'telefone:''(33)98122-1932',"'avatar':"'https://cdn.pixabay.com/photo/2016/08/20/05/38/avatar-1606916_1280.png'},

];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("lista de contato"),
          actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
                Navigator.of(context).pushNamed (MyApp.CONTACT_FORM);
            }  
          )
        ],
      
      ) ,
      body:ListView()
          );
  }
}