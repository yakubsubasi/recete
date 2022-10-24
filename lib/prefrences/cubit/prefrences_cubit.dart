import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recete/prefrences/model/prefences.dart';
import 'package:recete/prefrences/service/preferences_service.dart';

part 'prefrences_state.dart';

class PrefrencesCubit extends Cubit<Prefrences> {
  final PreferncesService _preferencesService;

  PrefrencesCubit(this._preferencesService, Prefrences initialState)
      : super(initialState);

  Future<void> changePrefrences(Prefrences prefrences) async {
    emit(prefrences);
    await _preferencesService.setPrefences(prefrences);
  }
}
