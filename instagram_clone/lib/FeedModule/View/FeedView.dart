import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/Data/User/UserAPI.dart';
import 'package:instagram_clone/Data/User/UserModel.dart';
import 'package:instagram_clone/DesignSystem/TextDesign.dart';
import 'package:instagram_clone/FeedModule/BLoC/FeedState.dart';
import 'package:instagram_clone/FeedModule/NavigationBLoC/FeedNavigationBloc.dart';

import '../BLoC/FeedBloc.dart';
import '../BLoC/FeedEvent.dart';
import '../NavigationBLoC/FeedNavigationEvent.dart';

class Feed extends StatefulWidget {
  final layoutConstrains = FeedLayoutConstrains();
  final UserModel? user;
  Feed({Key? key, this.user}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  TextDesign textDesign = TextDesign();
  List<ImageModel> storiesList = [], postList = [];
  late ImageModel perfilPhoto;
  late UserModel user;

  @override
  void initState() {
    super.initState();
    if(widget.user == null){
      BlocProvider.of<FeedBloc>(context).add(FeedFetchUserEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding:
              EdgeInsets.only(top: widget.layoutConstrains.verticalPadding),
          child: BlocBuilder<FeedBloc, FeedState>(
            builder: (BuildContext context, FeedState state) {
              return _mapStateToWidget(context, state);
            },
          ),
        )),
      ),
    );
  }

  Widget _mapStateToWidget(BuildContext context, FeedState state) {
    switch (state.runtimeType) {
      case FeedFetchedUserState:
        final _castedState = state as FeedFetchedUserState;
        user = _castedState.user;
        storiesList = user.friendStoriesList;
        perfilPhoto = user.perfilPhoto;
        postList = user.friendPostsList;

        return Column(
          children: [_buildTopContainer(), _buildPostsListView()],
        );
      default:
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: SizedBox(
                width: 25, height: 25, child: CircularProgressIndicator()),
          ),
        );
    }
  }

  Widget _buildTopContainer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: widget.layoutConstrains.mediumWidgetPadding),
            child: _buildFirstLayer(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.mediumWidgetPadding,
                left: widget.layoutConstrains.mediumWidgetPadding),
            child: _buildStoriesLayer(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.minorWidgetPadding),
            child: Container(
              height: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Row _buildFirstLayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/Instagram-Logo.png",
          height: widget.layoutConstrains.logoHeight,
          width: widget.layoutConstrains.logoHeight * 1.77,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.add_box_outlined),
              Icon(Icons.favorite_border),
              Icon(
                Icons.messenger_outline,
                color: Colors.black,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildStoriesLayer() {
    return SizedBox(
        height: 75.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: storiesList.length,
            itemBuilder: _buildStoriesCards));
  }

  Widget _buildStoriesCards(BuildContext context, int index) {
    return Padding(
      padding:
          EdgeInsets.only(right: widget.layoutConstrains.mediumWidgetPadding),
      child: Container(
          height: 75.0,
          width: 75.0,
          decoration: BoxDecoration(
            color: index == 0 ? Colors.white : Color(0xFFEFEFEF),
            shape: BoxShape.circle,
            border: index == 0
                ? Border.all(width: 1.5, color: Color(0xFFA4AEB7))
                : Border.all(width: 1.5, color: Color(0xFFF3B966)),
            image: DecorationImage(
                image: index == 0
                    ? NetworkImage(perfilPhoto.url)
                    : NetworkImage(storiesList[index - 1].url),
                fit: BoxFit.cover),
          )),
    );
  }

  Widget _buildPostsListView() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: postList.length,
          itemBuilder: _buildPost),
    );
  }

  Widget _buildPost(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(top: widget.layoutConstrains.minorWidgetPadding),
      child: Column(
        children: [
          _buildPostTitle(context, index),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.minorWidgetPadding),
            child: Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              height: 1,
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(postList[index].url),
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft),
              ))
        ],
      ),
    );
  }

  Row _buildPostTitle(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: widget.layoutConstrains.mediumWidgetPadding),
              child: Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFEF),
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: Color(0xFFF3B966)),
                    image: DecorationImage(
                        image: NetworkImage(storiesList[index].url),
                        fit: BoxFit.cover),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widget.layoutConstrains.minorWidgetPadding),
              child: textDesign.buildText(
                  "UserName ${index + 1}", 14, FontWeight.bold, Colors.black),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              right: widget.layoutConstrains.minorWidgetPadding),
          child: Icon(
            Icons.more_vert,
            size: 24,
          ),
        )
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        if (index == 2) {
          BlocProvider.of<FeedNavigationBloc>(context).add(
              FeedNavigationSwitchToPerfilEvent(context: context, user: user));
        }
      },
    );
  }
}

class FeedLayoutConstrains {
  late double horizontalPadding;
  double verticalPadding = 15.0,
      textPadding = 5.0,
      minorWidgetPadding = 10.0,
      mediumWidgetPadding = 15.0,
      majorWidgetPadding = 30.0,
      gigaWidgetPadding = 150.0,
      logoHeight = 65,
      storiesCardSize = 25.0,
      perfilImageSize = 35.0,
      downwardArrowIconSize = 24.0;
}
