import 'dart:developer';

import 'package:course_motobike/models/bike.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BikeSource {
  static Future<List<Bike>?> fetchFeaturedBikes() async {
    try {
      final ref = FirebaseFirestore.instance
          .collection('Bikes')
          .where('rating', isGreaterThanOrEqualTo: 4.5)
          .orderBy('rating', descending: true)
          .limit(3);
      final queryDocs = await ref.get();
      return queryDocs.docs.map((doc) => Bike.fromJson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<Bike>?> fetchNewsBikes() async {
    try {
      final ref = FirebaseFirestore.instance
          .collection('Bikes')
          .orderBy('release', descending: true)
          .limit(4);
      final queryDocs = await ref.get();
      return queryDocs.docs.map((doc) => Bike.fromJson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Bike?> fetchBike(String bikeId) async {
    try {
      final ref = FirebaseFirestore.instance.collection('Bikes').doc(bikeId);
      final doc = await ref.get();
      Bike? bike = doc.exists ? Bike.fromJson(doc.data()!) : null;
      return bike;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
