import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:agenda_crud/app/domain/interfaces/contact_dao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactDAOFirestore implements ContactDAO {
  late CollectionReference contactCollection;

  ContactDAOFirestore() {
    contactCollection = FirebaseFirestore.instance.collection('contact');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollection.get();
    return result.docs.map(
      (doc) => Contact(
        id: doc.reference.id,
        nome: doc['nome'],
        email: doc['email'],
        telefone: doc['telefone'],
        urlAvatar: doc['urlAvatar'],
      ),
    ).toList();
  }

  @override
  void remove(String id) {
    contactCollection.doc(id).delete();
  }

  @override
  void save(Contact contact) {
    contactCollection.doc(contact.id).set(
      {
        'nome': contact.nome,
        'email': contact.email,
        'telefone': contact.telefone,
        'urlAvatar': contact.urlAvatar,
      },
    );
  }
}

