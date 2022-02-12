// ignore_for_file: avoid_void_async

import 'package:at_client/at_client.dart';
import 'package:at_contact/at_contact.dart';
import 'package:at_contact/src/model/at_contact.dart';
import 'package:at_contacts_flutter/at_contacts_flutter.dart';
import 'package:at_contacts_flutter/models/contact_base_model.dart';
import 'package:at_contacts_flutter/services/contact_service.dart';
import 'package:at_contacts_group_flutter/at_contacts_group_flutter.dart';
import 'package:at_utils/src/logging/atsignlogger.dart';
import 'package:atsign_location_app/domain/contacts/i_contacts_facade.dart';
import 'package:atsign_location_app/infrastructure/on_boarding/backend_service.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:injectable/injectable.dart';

///implementation of the [IContactsFacade]
@LazySingleton(as: IContactsFacade)
class ContactsFacade implements IContactsFacade {
  final AtSignLogger _logger = AtSignLogger('At Contact Services');

  @override
  void initializeContactsServices() async {
    initializeContactsService(rootDomain: Constants.rootDomain);
    initializeGroupService(rootDomain: Constants.rootDomain);
  }

  // @override
  // Stream<List<BaseContact?>> getContacts() {
  //   final _contactService = ContactService();

  //   final s = _contactService.contactStream;
  //   final v = s.length;
  //   int l;
  //   v.then((value) => l = value);
  //   _contactService.deleteAtSign(atSign: '@22fine90');

  //   _logger.info(v);
  //   return s;
  // }
}
