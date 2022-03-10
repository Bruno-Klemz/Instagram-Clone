import 'package:bloc/bloc.dart';

import 'PerfilEvent.dart';
import 'PerfilState.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState>{
  PerfilBloc(PerfilState initialState) : super(initialState);
}