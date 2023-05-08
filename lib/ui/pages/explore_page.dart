import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({
    Key? key,
  }) : super(key: key);

  Widget containerNich() {
    return Container(
      height: 100,
      width: 100,
      color: kPrimaryColor,
      child: Text(
        'DATA 1',
        style: whiteTextStyle,
      ),
    );
  }

  Widget containerNich2() {
    return Container(
      height: 100,
      width: 100,
      color: kGreenColor,
      child: Text(
        'DATA 2',
        style: whiteTextStyle,
      ),
    );
  }

  Widget avatarIcon() {
    return const Center(
      child: CircleAvatar(
        radius: 100,
        backgroundImage: NetworkImage(
          'https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
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
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0), Colors.black.withOpacity(0.75)],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5C40CC),
              Color.fromARGB(178, 92, 64, 204),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}

// Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage('assets/splash_menu.png'))),
//     )




// new Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Awesome AppBar')),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [
//                   const Color(0xFF3366FF),
//                   const Color(0xFF00CCFF),
//                 ],
//                 begin: const FractionalOffset(0.0, 0.0),
//                 end: const FractionalOffset(1.0, 0.0),
//                 stops: [0.0, 1.0],
//                 tileMode: TileMode.clamp),
//           ),
//         ),
       
//       ),
      
//     );