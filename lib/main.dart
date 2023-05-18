import 'package:debut/blocs/cart/cart_bloc.dart';
import 'package:debut/blocs/category/category_bloc.dart';
import 'package:debut/blocs/wishlist/wishlist_bloc.dart';
import 'package:debut/config/app_router.dart';
import 'package:debut/config/theme.dart';
import 'package:debut/repositories/category/category_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => CategoryBloc(categoryRepository: CategoryRepository())),
      ],
      child: MaterialApp(
        title: 'Debut',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
