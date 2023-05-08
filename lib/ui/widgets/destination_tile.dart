import 'package:airplane/models/destination_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';
import '../../models/tile_model.dart';
import '../pages/detail_page.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;

  const DestinationTile(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(destination),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(destination.imageUrl),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style:
                        greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
                  )
                ],
              ),
            ),
            Row(
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
                  style: blackTextStyle.copyWith(fontWeight: medium),
                ),
                const SizedBox(width: 6),
              ],
            )
          ],
        ),
      ),
    );
  }
}
