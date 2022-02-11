import 'package:atsign_location_app/domain/contacts/i_contacts_facade.dart';
import 'package:injectable/injectable.dart';

@injectable
class AtContactInitialization {
  AtContactInitialization(this._contactsFacade);

  final IContactsFacade _contactsFacade;

  void call() => _contactsFacade.initializeContactsServices();
}
