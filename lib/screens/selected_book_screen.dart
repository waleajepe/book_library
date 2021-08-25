import 'package:book_library/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_screen.dart';

class SelectedBookScreen extends StatelessWidget {
  SelectedBookScreen({this.author, this.bookName, this.price, this.image});

  final String author;
  final String bookName;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            bookName,
                            style: TextStyle(color: kPriceColor),
                          ),
                        ),
                        Text(' Added to Read List'),
                      ],
                    ),
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                ));
              },
              child: Text('Add to Read List'),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.5,
                  backgroundColor: kMainColor,
                  flexibleSpace: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            top: 20,
                            left: 25,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                child: Icon(FontAwesomeIcons.chevronLeft),
                              ),
                            )),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 60.0),
                              height: 260,
                              width: 260,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/' + image + '.jpg'),
                                  fit: BoxFit.contain,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 25),
                              child: Text(
                                bookName,
                                style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: kBlackTextColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16, left: 25),
                              child: Text(
                                author,
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF33b537),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 60),
                      Padding(
                        padding: EdgeInsets.only(top: 16, right: 25),
                        child: Text(
                          '\$$price',
                          style: GoogleFonts.openSans(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: kPriceColor,
                          ),
                        ),
                      ),
                    ],
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
                          TabLabels(textLabel: 'Description'),
                          TabLabels(textLabel: 'Review'),
                          TabLabels(textLabel: 'Related'),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 25, right: 25),
                    child: Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kGreyTextColor,
                      ),
                    ),
                  ),
                ]))
              ],
            ),
          ),
        ));
  }
}
