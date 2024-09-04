import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/API_MANAGER.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getPopular(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return Center(child: Text('something went wrong'));
        }
        var PopularMovies = snapshot.data?.results ?? [];
        return Column(children: [
          CarouselSlider.builder(
              itemCount: PopularMovies.length,
              options: CarouselOptions(
                padEnds: false,
                autoPlay: false,
                height: MediaQuery.of(context).size.height * 0.340,
                enlargeCenterPage: true,
                viewportFraction: 1,
                disableCenter: true,
                initialPage: 0,
              ),
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) =>
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.33,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height:
                              MediaQuery.of(context).size.height *
                                  0.25,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/original/${PopularMovies[itemIndex].backdropPath}',
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 150,
                              left: 20,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 160,
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.19,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/original/${PopularMovies[itemIndex].posterPath}',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -8,
                                    left: -15,
                                    child: Stack(
                                      children: [
                                        Icon(
                                          Icons.bookmark,
                                          color: Color(0xff514F4F)
                                              .withOpacity(0.8),
                                          size: 65,
                                        ),
                                        Positioned(
                                          top: 18,
                                          left: 21,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 250,
                              left: 200,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    PopularMovies[itemIndex].title ?? '',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        PopularMovies[itemIndex]
                                            .releaseDate
                                            ?.substring(0, 4) ??
                                            '',
                                        style: GoogleFonts.inter(
                                          color: Color(0xffB5B4B4),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        PopularMovies[itemIndex]
                                            .originalLanguage ??
                                            '',
                                        style: GoogleFonts.inter(
                                          color: Color(0xffB5B4B4),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
        ]);
      },
    );
  }
}
