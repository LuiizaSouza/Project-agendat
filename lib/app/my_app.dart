
import 'package:agenda_crud_flutterr/app/View/Contact_list.dart';
import 'package:flutter/material.dart';
import 'View/Contact_form.dart';


class MyApp extends StatelessWidget {
static const HOME = '/';
static const CONTACT_FORM = 'contact_form';

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      routes: {
       HOME:(context)=>ContactList(),
       CONTACT_FORM:(context) => ContactForm()
      },
    );
  }
}