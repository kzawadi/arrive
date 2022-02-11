import 'package:at_contact/at_contact.dart';

abstract class IContactsFacade {
  ///This function initializes the at_contacts services
  ///its a must to initialize this function before accessing [AtContact]
  ///functions eg. no contact will be displayed in UI if this is not initialized
  void initializeContactsServices() {}
}
