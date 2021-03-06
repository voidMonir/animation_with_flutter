import 'package:animation_test/details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: h * .2,
              width: w,
              color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Animated App",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                  key: _listKey,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: 5, top: index == 0 ? 5 : 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: h * .1,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: h * .01),
                                    child: Hero(
                                      tag: "hero$index",
                                      child: Container(
                                        height: h * .08,
                                        width: h * .08,
                                        decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Title $index",
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text("Address $index"),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "price $index",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
