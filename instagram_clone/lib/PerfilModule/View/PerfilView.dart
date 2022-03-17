import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/Data/User/UserModel.dart';
import 'package:instagram_clone/DesignSystem/TextDesign.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilBloc.dart';
import 'package:instagram_clone/PerfilModule/NavigationBLoC/PerfilNavigationEvent.dart';

import '../../FeedModule/NavigationBLoC/FeedNavigationBloc.dart';
import '../../FeedModule/NavigationBLoC/FeedNavigationEvent.dart';
import '../BLoC/ViewBLoC/PerfilEvent.dart';
import '../BLoC/ViewBLoC/PerfilState.dart';
import '../NavigationBLoC/PerfilNavigationBloc.dart';

class Perfil extends StatefulWidget {
  final layoutConstrains = PerfilLayoutConstrains();
  final UserModel user;
  Perfil({Key? key, required this.user}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final textDesign = TextDesign();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget.layoutConstrains.verticalPadding,
              horizontal: widget.layoutConstrains.horizontalPadding),
          child: BlocBuilder<PerfilBloc, PerfilState>(
            builder: (BuildContext context, PerfilState state) {
              return _mapStateToView(context, state);
            },
          ),
        )),
      ),
    );
  }

  Widget _mapStateToView(BuildContext context, PerfilState state) {
    switch (state.runtimeType) {
      case PerfilInitialState:
        return Column(
          children: [
            _buildMainInfos(widget.user.perfilPhoto.url),
            Padding(
                padding: EdgeInsets.only(
                    top: widget.layoutConstrains.majorWidgetPadding),
                child: _buildGallery(widget.user.galleryList))
          ],
        );
      default:
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: SizedBox(
                width: 25, height: 25, child: CircularProgressIndicator()),
          ),
        );
    }
  }

  Container _buildMainInfos(String perfilPhotoURL) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainInfosFirstLayer(),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.majorWidgetPadding),
            child: _buildMainInfosSecondLayer(perfilPhotoURL),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.mediumWidgetPadding),
            child: _buildMainInfosThirdLayer(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.mediumWidgetPadding),
            child: _buildMainInfosForthLayer(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.mediumWidgetPadding),
            child: _buildMainInfosFifthLayer(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.mediumWidgetPadding),
            child: _buildMainInfosStoriesLayer(),
          ),
        ],
      ),
    );
  }

  Container _buildGallery(List<ImageModel> galleryList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _buildGalleryFirstLayer(),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.minorWidgetPadding),
            child: _buildGallerySecondLayer(),
          ),
          _buildGalleryGridView(galleryList)
        ],
      ),
    );
  }

  Row _buildMainInfosFirstLayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              textDesign.buildText(
                  'brunoklemz', 22, FontWeight.bold, Colors.black),
              Padding(
                padding:
                    EdgeInsets.only(left: widget.layoutConstrains.textPadding),
                child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: widget.layoutConstrains.downwardArrowIconSize,
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {})
            ],
          ),
        )
      ],
    );
  }

  Row _buildMainInfosSecondLayer(String perfilPhotoURL) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 90.0,
          width: 90.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(perfilPhotoURL))),
        ),
        Row(
          children: [
            _buildMainLabels('1', 'Publicações'),
            Padding(
              padding: EdgeInsets.only(
                  left: widget.layoutConstrains.minorWidgetPadding),
              child: _buildMainLabels('128', 'Seguidores'),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widget.layoutConstrains.minorWidgetPadding),
              child: _buildMainLabels('168', 'Seguindo'),
            ),
          ],
        )
      ],
    );
  }

  Column _buildMainInfosThirdLayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textDesign.buildText('Bruno Klemz', 15, FontWeight.w600, Colors.black),
        Padding(
            padding: EdgeInsets.only(top: widget.layoutConstrains.textPadding),
            child: textDesign.buildText('Engenharia Mecatrônica PUCPR', 15,
                FontWeight.normal, Colors.black)),
      ],
    );
  }

  Row _buildMainInfosForthLayer() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 41,
            child: OutlinedButton(
                onPressed: () {},
                child: textDesign.buildText(
                    'Editar perfil', 15, FontWeight.w600, Colors.black)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            height: 41,
            child: OutlinedButton(
                onPressed: () {},
                child: Icon(
                  Icons.person_add,
                  color: Colors.black,
                )),
          ),
        )
      ],
    );
  }

  Column _buildMainInfosFifthLayer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textDesign.buildText(
                'Destaques dos stories', 15, FontWeight.w600, Colors.black),
            Icon(Icons.keyboard_arrow_up)
          ],
        ),
        textDesign.buildText("Mantenha seus stories favoritos no seu perfil",
            14, FontWeight.normal, Colors.black)
      ],
    );
  }

  Widget _buildMainInfosStoriesLayer() {
    return SizedBox(
        height: 75.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.user.personalStoriesList.length + 1,
            itemBuilder: _buildCards));
  }

  Row _buildGalleryFirstLayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Icon(Icons.grid_on), Icon(Icons.person_pin_outlined)],
    );
  }

  Row _buildGallerySecondLayer() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget _buildGalleryGridView(List<ImageModel> galleryList) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemCount: galleryList.length,
          itemBuilder: (context, index) {
            return Image.network(
              galleryList[index].url,
              fit: BoxFit.cover,
            );
          }),
    );
  }

  Widget _buildCards(BuildContext context, int index) {
    return Padding(
      padding:
          EdgeInsets.only(right: widget.layoutConstrains.mediumWidgetPadding),
      child: Container(
        height: 75.0,
        width: 75.0,
        decoration: BoxDecoration(
            color: index == 0 ? Colors.white : Color(0xFFEFEFEF),
            shape: BoxShape.circle,
            border:
                index == 0 ? Border.all(width: 1.5, color: Colors.black) : null,
            image: index == 0
                ? null
                : DecorationImage(
                    image: NetworkImage(widget.user.personalStoriesList[index - 1].url),
                    fit: BoxFit.cover)),
        child: Center(
          child: index == 0 ? Icon(Icons.add) : null,
        ),
      ),
    );
  }

  Column _buildMainLabels(String title, String subtitle) {
    return Column(
      children: [
        textDesign.buildText(title, 17, FontWeight.bold, Colors.black),
        textDesign.buildText(subtitle, 15, FontWeight.normal, Colors.black)
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
      currentIndex: 2,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        if (index == 0) {
          BlocProvider.of<PerfilNavigationBloc>(context).add(
              PerfilNavigationSwitchToFeedEvent(context: context, user: widget.user));
        }
      },
    );
  }
}

class PerfilLayoutConstrains {
  double horizontalPadding = 15.0,
      verticalPadding = 15.0,
      textPadding = 5.0,
      minorWidgetPadding = 10.0,
      mediumWidgetPadding = 15.0,
      majorWidgetPadding = 20.0,
      storiesCardSize = 25.0,
      perfilImageSize = 35.0,
      downwardArrowIconSize = 24.0;
}
