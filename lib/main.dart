import 'package:flutter/material.dart';
import 'package:flutter_application_project/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_application_project/config/app_router.dart';
import 'package:flutter_application_project/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/widgets.dart';
import './config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishListBloc()..add(StartWishlist())),
      ],
      //create: (context) => SubjectBloc(),
      child: MaterialApp(
        title: 'Itwaar Bazaar',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
