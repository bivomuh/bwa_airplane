part of 'tile_cubit.dart';

abstract class TileState extends Equatable {
  const TileState();

  @override
  List<Object> get props => [];
}

class TileInitial extends TileState {}

class TileLoading extends TileState {}

class TileSuccess extends TileState {
  final List<DestinationModel> destinationsTile;

  const TileSuccess(this.destinationsTile);

  @override
  List<Object> get props => [destinationsTile];
}

class TileFailed extends TileState {
  final String error;

  const TileFailed(this.error);

  @override
  List<Object> get props => [error];
}
