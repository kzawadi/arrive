import 'package:at_contacts_flutter/at_contacts_flutter.dart';
import 'package:atsign_location_app/domain/contacts/i_contacts_facade.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:injectable/injectable.dart';

///implementation of the [IContactsFacade]
@LazySingleton(as: IContactsFacade)
class ContactsFacade implements IContactsFacade {
  @override
  void initializeContactsServices() {
    initializeContactsService(rootDomain: Constants.rootDomain);
  }
}
