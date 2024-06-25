import 'package:agenda_crud/app/domain/entities/contact.dart';
import 'package:mobx/mobx.dart';
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Contact_list_back.dart';


mixin _$ContactListBack on _ContactListBack, Store {
  final _$listAtom = Atom(name: '_ContactListBack.list');

  @override
  Future<List<Contact>> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(Future<List<Contact>> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_ContactListBackActionController =
      ActionController(name: '_ContactListBack');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ContactListBackActionController.startAction(
        name: '_ContactListBack.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ContactListBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}

class _ContactListBack {
}