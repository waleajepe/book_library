import 'package:book_library/screens/selected_book_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:book_library/constants/constants.dart';
import 'package:book_library/data/category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Hello! Joe',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: kGreyTextColor,
                      )),
                  SizedBox(height: 8),
                  Text(
                    'Discover Latest Books',
                    style: GoogleFonts.openSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: kBlackTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kLightColor,
              ),
              child: Stack(
                children: <Widget>[
                  TextField(
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: kBlackTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search a book ...',
                      contentPadding:
                          EdgeInsets.only(left: 20.0, right: 15.0, bottom: 8.0),
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.openSans(
                          fontSize: 12,
                          color: kBlackTextColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                    right: 20.0,
                    height: 35.0,
                    width: 35.0,
                    child: SvgPicture.asset(
                      'assets/svg/search_book.svg',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 25,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  isScrollable: true,
                  labelColor: kBlackTextColor,
                  unselectedLabelColor: kGreyTextColor,
                  labelStyle: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: [
                    TabLabels(textLabel: 'New'),
                    TabLabels(textLabel: 'Trending'),
                    TabLabels(textLabel: 'Best Seller'),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 21),
              height: 210,
              child: ListView.builder(
                  padding: EdgeInsets.only(left: 25, right: 6),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectedBookScreen(
                                    author: categories[index].author,
                                    bookName: categories[index].bookName,
                                    price: categories[index].price,
                                    image: categories[index].image)));
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 0, right: 10),
                          height: 210,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/' +
                                    categories[index].image +
                                    '.jpg'),
                              ))),
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'Popular',
                style: GoogleFonts.openSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: kBlackTextColor,
                ),
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                itemCount: categories.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectedBookScreen(
                                  author: categories[index].author,
                                  bookName: categories[index].bookName,
                                  price: categories[index].price,
                                  image: categories[index].image)));
                    },
                    child: Container(
                      color: kBoxColor,
                      width: MediaQuery.of(context).size.width - 50,
                      height: 85,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 85,
                            width: 65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/' +
                                        categories[index].image +
                                        '.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 14.0),
                              Text(categories[index].bookName,
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: kBlackTextColor,
                                  )),
                              SizedBox(height: 5.0),
                              Text('Author: ' + categories[index].author,
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: kBlackTextColor,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class TabLabels extends StatelessWidget {
  TabLabels({@required this.textLabel});

  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Container(
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Text('$textLabel'),
      ),
    ));
  }
}
