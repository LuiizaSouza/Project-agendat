import 'package:agenda_crud/app/Domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack {
  final BuildContext context;
  late final Contact contact;

  ContactDetailsBack(this.context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Contact) {
      contact = args;
    } else {
      throw Exception('Contact argument is missing or invalid.');
    }
  }

  void goToBack() {
    Navigator.of(context).pop();
  }

  Future<void> _launchApp(String url, Function(BuildContext context) showModalError) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showModalError(context);
    }
  }

  void launchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${contact.telefone}', showModalError);
  }

  void launchSMS(Function(BuildContext context) showModalError) {
    _launchApp('sms:${contact.telefone}', showModalError);
  }

  void launchEmail(Function(BuildContext context) showModalError) {
    _launchApp('mailto:${contact.email}', showModalError);
  }
}
