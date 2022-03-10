import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  final layoutConstrains = PerfilLayoutConstrains();
  Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  void initState() {
    super.initState();
  }

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
          child: Column(
            children: [
              _buildMainInfos(),
              Padding(
                  padding: EdgeInsets.only(
                      top: widget.layoutConstrains.majorWidgetPadding),
                  child: _buildGallery())
            ],
          ),
        )),
      ),
    );
  }

  Container _buildMainInfos() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMainInfosFirstLayer(),
          Padding(
            padding: EdgeInsets.only(
                top: widget.layoutConstrains.majorWidgetPadding),
            child: _buildMainInfosSecondLayer(),
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
            child: _buildMainInfosSixthLayer(),
          ),
        ],
      ),
    );
  }

  Container _buildGallery() {
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
          _buildGalleryThirdLayer()
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
              _buildText('brunoklemz', 22, FontWeight.bold),
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

  Row _buildMainInfosSecondLayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 90.0,
          width: 90.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/placeholderPhoto.jpg'))),
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
        _buildText('Bruno Klemz', 15, FontWeight.w600),
        Padding(
            padding: EdgeInsets.only(top: widget.layoutConstrains.textPadding),
            child: _buildText(
                'Engenharia Mecatrônica PUCPR', 15, FontWeight.normal)),
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
                child: _buildText('Editar perfil', 15, FontWeight.w600)),
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
            _buildText('Destaques dos stories', 15, FontWeight.w600),
            Icon(Icons.keyboard_arrow_up)
          ],
        ),
        _buildText("Mantenha seus stories favoritos no seu perfil", 14,
            FontWeight.normal)
      ],
    );
  }

  Widget _buildMainInfosSixthLayer() {
    return SizedBox(
        height: 75.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
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

  Widget _buildGalleryThirdLayer() {
    return SizedBox(
      height: 2000,
      width: MediaQuery.of(context).size.width,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        children: [
          Image.asset("assets/placeholderPhoto.jpg"),
          Image.asset("assets/placeholderPhoto.jpg"),
          Image.asset("assets/placeholderPhoto.jpg"),
          Image.asset("assets/placeholderPhoto.jpg"),
          Image.asset("assets/placeholderPhoto.jpg"),
          Image.asset("assets/placeholderPhoto.jpg"),
          Image.asset("assets/placeholderPhoto.jpg"),
          Image.asset("assets/placeholderPhoto.jpg"),
        ],
      ),
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
            border: index == 0
                ? Border.all(width: 1.5, color: Colors.black)
                : null),
        child: Center(
          child: index == 0 ? Icon(Icons.add) : null,
        ),
      ),
    );
  }

  Text _buildText(String title, double fontSize, FontWeight fontWeight) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.black),
    );
  }

  Column _buildMainLabels(String title, String subtitle) {
    return Column(
      children: [
        _buildText(title, 17, FontWeight.bold),
        _buildText(subtitle, 15, FontWeight.normal)
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    int _selectedIndex = 0;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      ],
      currentIndex: _selectedIndex,
      onTap: (int index) {},
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
