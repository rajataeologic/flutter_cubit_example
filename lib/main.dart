import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_example/cubit/PlayerListingCubit.dart';
import 'package:flutter_cubit_example/data/RestRequest.dart';
import 'package:flutter_cubit_example/ui/HomePage.dart';
import 'package:flutter_cubit_example/ui/PlayerListingScreen.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => PlayerCubit(playerRepository: new RestRequest()),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {'/':(context)=>HomePage(),'/playerListing':(context)=> PlayerListingScreen()},
    );
  }
}
