import 'package:course_motobike/firebase_options.dart';
import 'package:course_motobike/models/bike.dart';
import 'package:course_motobike/pages/booking_page.dart';
import 'package:course_motobike/pages/chatting_page.dart';
import 'package:course_motobike/pages/checkout_page.dart';
import 'package:course_motobike/pages/detail_page.dart';
import 'package:course_motobike/pages/discover_page.dart';
import 'package:course_motobike/pages/pin_page.dart';
import 'package:course_motobike/pages/signin_page.dart';
import 'package:course_motobike/pages/signup_page.dart';
import 'package:course_motobike/pages/splash_screen.dart';
import 'package:course_motobike/pages/succes_booking_page.dart';
import 'package:d_session/d_session.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffEFEFF0),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: FutureBuilder(
        // 1. Mulai ambil data user
        future: DSession.getUser(),
        builder: (context, snapshot) {
          // 2. Kalo sedang loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // 3. Kalo data user ga ada
          if (snapshot.data == null) {
            return const SplashScreen();
          }
          // 4. Kalo data user ada
          return const DiscoverPage();
        },
      ),
      routes: {
        "/discover": (context) => const DiscoverPage(),
        "/signup": (context) => const SignUpPage(),
        "/signin": (context) => const SignInPage(),
        "/detail": (context) {
          String bikeId = ModalRoute.of(context)!.settings.arguments as String;
          return DetailPage(bikeId: bikeId);
        },
        "/booking": (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return BookingPage(bike: bike);
        },
        "/checkout": (context) {
          // Mapping Data
          Map data = ModalRoute.of(context)!.settings.arguments as Map;

          // Pecah Data
          Bike bike = data['bike'];
          String startDate = data['startDate'];
          String endDate = data['endDate'];

          return CheckoutPage(
            bike: bike,
            startDate: startDate,
            endDate: endDate,
          );
        },
        "/pin": (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return PINPage(bike: bike);
        },
        "/success-booking": (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return SuccesBookingPage(bike: bike);
        },
        "/chatting": (context) {
          // Mapping Data
          Map data = ModalRoute.of(context)!.settings.arguments as Map;

          // Pecah Data
          String uid = data['uid'];
          String userName = data['userName'];

          return ChattingPage(uid: uid, userName: userName);
        },
      },
    );
  }
}
