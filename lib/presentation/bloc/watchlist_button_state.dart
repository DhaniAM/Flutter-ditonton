import 'package:equatable/equatable.dart';

abstract class WatchlistButtonState extends Equatable {
  const WatchlistButtonState();

  @override
  List<Object> get props => [];
}

class WatchlistButtonEmpty extends WatchlistButtonState {}

class WatchlistButtonError extends WatchlistButtonState {
  final String message;
  WatchlistButtonError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistButtonHasData extends WatchlistButtonState {
  final String message;

  /// true = in watchlist,
  /// false = not in watchlist
  final bool isInWatchlist;
  WatchlistButtonHasData(this.message, this.isInWatchlist);

  @override
  List<Object> get props => [message, isInWatchlist];
}
