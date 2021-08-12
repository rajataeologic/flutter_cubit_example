
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_example/models/NationModel.dart';
import 'package:flutter_cubit_example/models/PlayerDataModel.dart';

import '../data/RestRequest.dart';
import 'PlayerListingState.dart';

class PlayerCubit extends Cubit<PlayerListingState> {
  RestRequest ?playerRepository;
  PlayerCubit({required this.playerRepository}) : super(PlayerUnintializedState());

  void fetchingData(NationModel nation) async {
    List<Players> ?players;
    emit(FetchingState());
    try {
      players = await playerRepository!
          .fetchPlayersByCountry(nation.countryId);

      if (players!.length == 0) {
        emit(EmptyState());
      } else {
        emit(FetchedState(playerList: players));
      }
    } catch (e) {

      print(e);
      emit(ErrorState());
    }
  }
  @override
  void onChange(Change<PlayerListingState> change) {
    // TODO: implement onChange
    print("Observer :$change");
    super.onChange(change);
  }
}

