import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/API_MANAGER.dart';

class NewReleaseItem extends StatelessWidget {
  const NewReleaseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewRelease(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return Center(child: Text('something went wrong'));
        }
        var NewReleaseMovies = snapshot.data?.results ?? [];
        return Container(
          color: Color(0xff282A28),
          height: MediaQuery.of(context).size.height * 0.23,
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
                    itemCount: NewReleaseMovies.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 25,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 135,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              color: Color(0xff282A28),
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/original/${NewReleaseMovies[index].backdropPath}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -9,
                            left: -13.7,
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
