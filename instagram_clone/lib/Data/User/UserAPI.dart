import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_clone/Data/User/UserModel.dart';

class UserAPI {
  FirebaseStorage storage = FirebaseStorage.instance;
  String? currentUser = FirebaseAuth.instance.currentUser?.uid;

  Future<UserModel> getUserByID() async {
    List<ImageModel> personalStoriesList = await _getImagesByID("PersonalStories");
    List<ImageModel> friendStoriesList = await _getImagesByID("FriendStories");

    List<ImageModel> friendPostsList = await _getImagesByID("FriendPosts");

    List<ImageModel> galleryList = await _getImagesByID("Gallery");

    ImageModel perfilPhoto = await _getUniqueImage("PerfilPhoto");

    UserModel user = UserModel(
        personalStoriesList: personalStoriesList,
        friendStoriesList: friendStoriesList,
        friendPostsList: friendPostsList,
        galleryList: galleryList,
        perfilPhoto: perfilPhoto);

    return user;
  }

  Future<List<ImageModel>> _getImagesByID(String infoDesiredChildName) async {
    List<ImageModel> imageList = [];
    Reference ref = storage.ref("Users/$currentUser/$infoDesiredChildName");
    ListResult result = await ref.listAll();
    result.items.forEach((element) async {
      String storiesURL = await element.getDownloadURL().then((value) => value);
      ImageModel personalStories = ImageModel(storiesURL);
      imageList.add(personalStories);
    });
    return imageList;
  }

  Future<ImageModel> _getUniqueImage(String infoDesiredChildName) async {
    print(currentUser);
    Reference ref = storage.ref("Users/$currentUser/$infoDesiredChildName");
    ListResult result = await ref.list();
    String imageURL =
        await result.items.single.getDownloadURL().then((value) => value);
    return ImageModel(imageURL);
  }
}
