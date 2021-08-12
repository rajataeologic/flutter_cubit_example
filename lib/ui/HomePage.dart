import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_example/cubit/PlayerListingCubit.dart';
import 'package:flutter_cubit_example/models/NationModel.dart';
import 'package:flutter_cubit_example/res/Strings.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: List.generate(nations.length, (index) {
            NationModel model = nations.elementAt(index);
            return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: ListTile(
                  shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                  onTap: () {
                    context
                        .read<PlayerCubit>()
                        ..fetchingData(model);
                    Navigator.pushNamed(context, '/playerListing');
                  },
                  tileColor: Colors.grey[300],
                  title: Text(model.nationName),
                ));
          }),
        ),
      ),
    );
  }
}
