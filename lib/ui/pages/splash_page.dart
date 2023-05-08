import 'dart:async';
import 'package:airplane/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/get-started', (route) => false);
      } else {
        print(user.email);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff5C40CC),
              Color.fromARGB(255, 47, 106, 194),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 23,
                height: 23,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/icon_plane.png'))),
              ),
              const SizedBox(width: 5),
              Text(
                'airplane',
                style: whiteTextStyle.copyWith(
                    letterSpacing: 2.72, fontSize: 32, fontWeight: medium),
              )
            ],
          ),
        ),
      ),
    );
  }
}




// body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 100,
//               width: 100,
//               margin: const EdgeInsets.only(bottom: 50),
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage('assets/icon_plane.png'))),
//             ),
//             Text('flyjunkies',
//                 style: whiteTextStyle.copyWith(
//                     fontSize: 32, letterSpacing: 2.72, fontWeight: medium))
//           ],
//         ),
//       ),