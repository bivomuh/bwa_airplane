import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/image_get_started.png'))),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Fly Like a Bird',
                  style: whiteTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Explore new world with us and let \n yourself get an amazing experiences',
                  textAlign: TextAlign.center,
                  style: whiteTextStyle.copyWith(
                    height: 1.5,
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
                CustomButton(
                  title: 'Get Started',
                  width: 220,
                  onPressed: (() {
                    Navigator.pushNamed(context, '/sign-up');
                  }),
                  margin: const EdgeInsets.only(top: 50, bottom: 80),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
