import 'package:bloc/bloc.dart';
import 'package:instagram_clone/Data/User/UserRepository.dart';

import '../../../Data/User/UserModel.dart';
import 'PerfilEvent.dart';
import 'PerfilState.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState> {
  PerfilBloc(PerfilState initialState, UserRepository repo)
      : super(initialState) {
    on<PerfilFetchUserEvent>((event, emit) async {
      UserModel user = await repo.fetchUser();
      emit(PerfilFetchedUserState(
          perfilPhoto: user.perfilPhoto,
          galleryList: user.galleryList,
          personalStoriesList: user.personalStoriesList));
    });
  }
}
