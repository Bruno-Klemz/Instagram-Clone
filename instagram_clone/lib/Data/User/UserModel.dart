class UserModel {
  final List<ImageModel> personalStoriesList, galleryList, friendStoriesList, friendPostsList;
  final ImageModel perfilPhoto;

  UserModel(
      {required this.personalStoriesList,
      required this.friendStoriesList,
      required this.friendPostsList, required this.galleryList, required this.perfilPhoto});
}

class ImageModel {
  final String url;

  ImageModel(this.url);
}
