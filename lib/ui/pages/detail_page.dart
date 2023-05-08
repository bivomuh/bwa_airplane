import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;

  const DetailPage(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        height: 214,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0),
            Colors.black.withOpacity(0.75)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            // !NOTE: EMBLEM
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 108,
              height: 24,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icon_emblem.png'),
                ),
              ),
            ),

            // !NOTE: TITLE
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.name,
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        destination.city,
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      destination.rating.toString(),
                      style: whiteTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
              ]),
            ),

            // !NOTE: DESCRIPTION
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: kWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                        fontWeight: regular, height: 1.9),
                  ),

                  // !NOTE: PHOTOS
                  const SizedBox(height: 20),
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: const [
                      PhotoItem(imageUrl: 'assets/image_photo1.png'),
                      PhotoItem(imageUrl: 'assets/image_photo2.png'),
                      PhotoItem(imageUrl: 'assets/image_photo3.png'),
                    ],
                  ),

                  // !INTEREST
                  const SizedBox(height: 20),
                  Text(
                    'Intererst',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      InterestItem(
                        text: 'Kids Park ',
                      ),
                      InterestItem(
                        text: 'Honor Bridge',
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      InterestItem(
                        text: 'City Museum',
                      ),
                      InterestItem(
                        text: "Central Mall",
                      )
                    ],
                  ),
                ],
              ),
            ),
            // !PRICE and BOOK NOW BUTTON
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'IDR ',
                            decimalDigits: 0,
                          ).format(destination.price),
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: medium),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  CustomButton(
                    width: 170,
                    title: 'Book Now',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseSeatPage(destination),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(children: [
          backgroundImage(),
          customShadow(),
          content(),
        ]),
      ),
    );
  }
}
