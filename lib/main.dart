import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/details_screen.dart';
import 'package:meditation_app/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Cairo",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: MyHomePage(),
      routes: {Details.routeName: (ctx) => Details()},
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var size = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(379.8),
              decoration: const BoxDecoration(
                  color: Color(0xFFF5CEB8),
                  image: DecorationImage(
                      // scale: 1,
                      alignment: Alignment.centerLeft,
                      image: AssetImage(
                        "assets/images/undraw_pilates_gpdb.png",
                      ))),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: getProportionateScreenHeight(52),
                        width: getProportionateScreenWidth(52),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFF2BEA1),
                        ),
                        child: SvgPicture.asset("assets/icons/menu.svg"),
                      ),
                    ),
                    Text("Good Morning \nKarlo",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.w900)),
                    SearchFieldWid(),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: getProportionateScreenWidth(20),
                        mainAxisSpacing: getProportionateScreenWidth(20),
                        childAspectRatio: 0.85,
                        children: const [
                          CategoryCard(
                            svgSrc: "assets/icons/Hamburger.svg",
                            title: "Diet Recommendation",
                          ),
                          CategoryCard(
                            svgSrc: "assets/icons/Excrecises.svg",
                            title: "Kegel Exercises",
                          ),
                          CategoryCard(
                            svgSrc: "assets/icons/Meditation.svg",
                            title: "Meditation",
                          ),
                          CategoryCard(
                            svgSrc: "assets/icons/yoga.svg",
                            title: "Yoga",
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class SearchFieldWid extends StatelessWidget {
  const SearchFieldWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(30)),
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(5),
          horizontal: getProportionateScreenWidth(30)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(getProportionateScreenHeight(29.5))),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search",
            icon: SvgPicture.asset("assets/icons/search.svg"),
            border: InputBorder.none),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenHeight(10)),
      color: Colors.white,
      height: getProportionateScreenHeight(70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset("assets/icons/calendar.svg"),
                Text("Today")
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset("assets/icons/gym.svg"),
                Text(
                  "All Exercises",
                  style: TextStyle(color: kActiveIconColor),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset("assets/icons/Settings.svg"),
                Text("Settings")
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title, svgSrc;
  const CategoryCard({
    Key? key,
    required this.title,
    required this.svgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(getProportionateScreenHeight(13)),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, getProportionateScreenHeight(17)),
                blurRadius: getProportionateScreenHeight(17),
                spreadRadius: getProportionateScreenHeight(-23),
                color: kShadowColor)
          ],
          color: Colors.white,
        ),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Details.routeName);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20),
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: getProportionateScreenHeight(16)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
