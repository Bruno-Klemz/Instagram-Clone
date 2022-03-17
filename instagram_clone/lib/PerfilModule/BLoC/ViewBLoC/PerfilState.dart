import '../../../Data/User/UserModel.dart';

abstract class PerfilState {}

class PerfilInitialState extends PerfilState {}

class PerfilFetchedUserState extends PerfilState {
  final ImageModel perfilPhoto;
  final List<ImageModel> galleryList, personalStoriesList;

  PerfilFetchedUserState(
      {required this.perfilPhoto, required this.galleryList, required this.personalStoriesList});
}
