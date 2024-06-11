
import 'package:agenda_crud/app/View/Contact_list.dart';
import 'package:agenda_crud/app/view/contact_form.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const CONTACT_FORM =  'contact-form';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
      HOME : (context) => ContactList(),
      CONTACT_FORM : (context) => ContactForm()
      },
    );
  }
}