import 'package:atsign_location_app/domain/contacts/use_cases/get_active_atsign_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'drawer_state.dart';
part 'drawer_cubit.freezed.dart';

@injectable
class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(this._getActiveAtsignUseCase)
      : super(const DrawerState.initial());

  final GetActiveAtsignUseCase _getActiveAtsignUseCase;

  void getAtsign() {
    final atsign = _getActiveAtsignUseCase.call();

    emit(DrawerState.atSignLoaded(atsign));
  }
}
