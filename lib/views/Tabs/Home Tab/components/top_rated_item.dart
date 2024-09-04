import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/API_MANAGER.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getTopRated(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return Center(child: Text('something went wrong'));
        }
        var TopRatedMovies = snapshot.data?.results ?? [];
        return Container(
          color: Color(0xff282A28),
          height: MediaQuery.of(context).size.height * 0.32,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Releases',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: TopRatedMovies.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 160,
                            height: 280,
                            decoration: BoxDecoration(
                              color: Color(0xff343534),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  child: Image(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/original/${TopRatedMovies[index].backdropPath}'),
                                    width: double.infinity,
                                    height: 140,
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        AssetImage(
                                          'assets/images/star.png',
                                        ),
                                        size: 24,
                                        color: Color(0xffFFA90A),
                                      ),
                                      Text(
                                        '${TopRatedMovies[index].voteAverage}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 12.0),
                                  child: Text(
                                    TopRatedMovies[index].title ?? "",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        TopRatedMovies[index]
                                            .releaseDate
                                            ?.substring(0, 4) ??
                                            '',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        TopRatedMovies[index]
                                            .originalLanguage ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      // Text(data),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: -11,
                            left: -14,
                            child: Stack(
                              children: [
                                Icon(
                                  Icons.bookmark,
                                  color:
                                  Color(0xff514F4F).withOpacity(0.8),
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
