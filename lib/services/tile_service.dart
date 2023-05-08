import 'package:airplane/models/destination_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TileService {
  final CollectionReference _tileRef =
      FirebaseFirestore.instance.collection('destinationsTile');

  Future<List<DestinationModel>> fetchTile() async {
    try {
      QuerySnapshot result = await _tileRef.get();

      List<DestinationModel> destinationsTile = result.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinationsTile;
    } catch (e) {
      rethrow;
    }
  }
}
