import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class ContactList extends StatelessWidget {
  final _back = ContactListBack();

  CircleAvatar circleAvatar(String? url) {
    return CircleAvatar(
      backgroundImage: url != null && Uri.tryParse(url)!.isAbsolute
          ? NetworkImage(url)
          : null,
      child: url == null || !Uri.tryParse(url)!.isAbsolute
          ? Icon(Icons.person)
          : null,
    );
  }

  Widget iconEditButton(Function onPressed) {
    return IconButton(
      icon: Icon(Icons.edit),
      color: Colors.orange,
      onPressed: onPressed as void Function()?,
    );
  }

  Widget iconRemoveButton(BuildContext context, Function onPressed) {
    return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: onPressed as void Function()?,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _back.goToForm(context);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return FutureBuilder<List<Contact>>(
            future: _back.list,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro ao carregar contatos'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('Nenhum contato encontrado'));
              } else {
                List<Contact>? contacts = snapshot.data;
                return ListView.builder(
                  itemCount: contacts!.length,
                  itemBuilder: (context, index) {
                    var contact = contacts[index];
                    return ListTile(
                      leading: circleAvatar(contact.urlAvatar),
                      title: Text(contact.nome ?? ''),
                      onTap: () {
                        _back.goToDetails(context, contact);
                      },
                      subtitle: Text(contact.telefone ?? ''),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            iconEditButton(() {
                              _back.goToForm(context, contact);
                            }),
                            iconRemoveButton(context, () {
                              _back.remove(contact.id);
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
