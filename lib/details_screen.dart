import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/main.dart';
import 'package:meditation_app/size_config.dart';

class Details extends StatelessWidget {
  static const routeName = '/details';
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: getProportionateScreenHeight(379.9),
            decoration: const BoxDecoration(
                color: kBlueLightColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/meditation_bg.png'),
                    fit: BoxFit.fitWidth)),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(42.2)),
                Text(
                  "Meditation",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Text(
                  "3-10 MIN Course",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text(
                      "live happier and healthier by learning the fundamentals of meditation"),
                ),
                SizedBox(
                  child: SearchFieldWid(),
                  width: MediaQuery.of(context).size.width * .5,
                ),
                // Wrap(
                //   spacing: 1,
                //   children: [
                //     SessionCard(
                //       sessionNum: 1,
                //       isDone: false,
                //     ),
                //     SessionCard(
                //       sessionNum: 2,
                //       isDone: false,
                //     ),
                //     SessionCard(
                //       sessionNum: 3,
                //       isDone: true,
                //     )
                //   ],
                // )
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    mainAxisSpacing: getProportionateScreenHeight(10),
                    crossAxisSpacing: getProportionateScreenHeight(10),
                    children: List.generate(
                        6,
                        (index) => SessionCard(
                              sessionNum: index + 1,
                              isDone: index == 0,
                            )),
                  ),
                ),

                Container(
                  child: Text("Meditation",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ),

                Container(
                  height: getProportionateScreenHeight(140),
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(15)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CategoryCard(),
                        CategoryCard(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(10),
      height: getProportionateScreenHeight(90),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor)
          ]),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/Meditation_women_small.svg"),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Basic 2",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text("Start your deepen you pratice")
            ],
          )),
          Padding(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset("assets/icons/Lock.svg"),
          )
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  const SessionCard({
    Key? key,
    required this.sessionNum,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, snapshot) {
      return Container(
        width: snapshot.maxWidth / 2,
        padding: EdgeInsets.all(getProportionateScreenHeight(16)),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: kShadowColor)
            ],
            borderRadius: BorderRadius.circular(13)),
        child: Row(
          children: [
            Container(
              height: getProportionateScreenHeight(42),
              width: getProportionateScreenWidth(43),
              decoration: BoxDecoration(
                  color: isDone ? kBlueColor : Colors.white,
                  border: Border.all(color: kBlueColor),
                  borderRadius: BorderRadius.circular(23)),
              child: Icon(
                Icons.play_arrow,
                color: isDone ? Colors.white : kBlueColor,
              ),
            ),
            SizedBox(
              width: getProportionateScreenHeight(10),
            ),
            Text(
              "Session ${sessionNum}",
              style: Theme.of(context).textTheme.subtitle2,
            )
          ],
        ),
      );
    });
  }
}
