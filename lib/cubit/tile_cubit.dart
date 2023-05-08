import 'package:airplane/models/destination_model.dart';
import 'package:airplane/services/tile_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tile_state.dart';

class TileCubit extends Cubit<TileState> {
  TileCubit() : super(TileInitial());

  void fetchTile() async {
    try {
      emit(TileLoading());

      List<DestinationModel> destinations = await TileService().fetchTile();

      emit(TileSuccess(destinations));
    } catch (e) {
      emit(TileFailed(e.toString()));
    }
  }
}
