import 'package:atsign_location_app/domain/contacts/i_contacts_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetActiveAtsignUseCase {
  GetActiveAtsignUseCase(this._contactsFacade);

  final IContactsFacade _contactsFacade;
  Option<String> call() => _contactsFacade.getOnBoardedAtSign();
}
