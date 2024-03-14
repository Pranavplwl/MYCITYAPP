import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mycityapp/components/my_images.dart';
import 'package:mycityapp/components/t_rounded_image.dart';

class SupportTab extends StatelessWidget {
  const SupportTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 52.0, vertical: 0),
              child: Row(
                children: [
                  Text(
                    'Welcome to ',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                  ),
                  const Text(
                    ' Trashtrek',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  TRoundedImage(imageUrl: "lib/images/4.jpg", borderRadius: 0),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '''At TrashTrek, we're on a mission to revolutionize waste management, one doorstep at a time. Say goodbye to cluttered homes and overflowing bins – we're here to simplify your life while making a positive impact on the planet.
            ''',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(viewportFraction: 1),
                    items: const [
                      TRoundedImage(
                        width: 350,
                        imageUrl: Timages.promoBanner1,
                        borderRadius: 20,
                        fit: BoxFit.fill,
                      ),
                      TRoundedImage(
                        width: 350,
                        imageUrl: Timages.promoBanner2,
                        borderRadius: 20,
                        fit: BoxFit.fill,
                      ),
                      TRoundedImage(
                        width: 350,
                        imageUrl: Timages.promoBanner3,
                        borderRadius: 20,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                  const SizedBox(height: 0),
                  // Row(
                  //   children: [
                  //     for (int i = 0; i < 3; i++)
                  //       const TcircularContainer(
                  //         width: 20,
                  //         height: 4,
                  //         margin: EdgeInsets.only(right: 16),
                  //         backgroundColor: Colors.black,
                  //       ),
                  //   ],
                  // )
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 84.0, vertical: 0),
              child: Row(
                children: [
                  Text(
                    'Why',
                    style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                  ),
                  const Text(
                    ' Trashtrek ?',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                '''Convenience: No more lugging heavy bags to the curb or scheduling inconvenient trips to the recycling center. With TrashTrek, simply schedule a pickup, and we'll handle the rest.

Sustainability: We're committed to reducing waste and minimizing our environmental footprint. By partnering with TrashTrek, you're joining a movement towards a cleaner, greener future.

Community: We believe in the power of community collaboration. By working together, we can make a real difference in preserving our planet for generations to come.



            ''',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
