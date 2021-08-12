import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_example/cubit/PlayerListingCubit.dart';
import 'package:flutter_cubit_example/cubit/PlayerListingState.dart';
import 'package:flutter_cubit_example/models/PlayerDataModel.dart';
import 'package:flutter_cubit_example/res/Strings.dart';
import 'package:flutter_cubit_example/widgets/Message.dart';

class PlayerListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.playerListingTitle),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder<PlayerCubit,PlayerListingState>(
                bloc: BlocProvider.of<PlayerCubit>(context),
                builder: (context, state) {
                  if (state is PlayerUnintializedState) {
                    return Message(
                        message: "Unintialized State");
                  } else if (state is EmptyState) {
                    return Message(message: "No Players found");
                  } else if (state is ErrorState) {
                    return Message(message: "Something went wrong");
                  } else if (state is FetchingState) {
                    return  Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    final stateAsPlayerFetchedState = state as FetchedState;
                    final players = stateAsPlayerFetchedState.playerList;
                    return buildPlayersList(players!);
                  }

                }),
          ],
        ),
      ),
    );
  }
  Widget buildPlayersList(List<Players> players) {
    return  Expanded(
      child: ListView(children: List.generate(players.length, (index) {
        return Card(child: ListTile(title: Text(players.elementAt(index).name!),));
      }),),
    );

  }

}
