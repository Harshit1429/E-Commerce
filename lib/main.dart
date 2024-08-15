import 'package:ecommerce/Utils/Routes/Routes_name.dart';
import 'package:ecommerce/res/index.dart';
import 'package:ecommerce/view_model/cartPageViewModel.dart';
import 'package:ecommerce/view_model/homeViewModel.dart';
import 'package:ecommerce/view_model/wishlistViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Utils/Routes/routes.dart';

void main(){
  runApp(
      MultiProvider(providers: [

        ChangeNotifierProvider(create: (context) => HomeViewModel(),),

        ChangeNotifierProvider(create: (context) => Index(),),

        ChangeNotifierProvider(create: (context) => CartPageViewModel(),),

        ChangeNotifierProvider(create: (context) => WishListViewModel(),),

      ],child:
       const MaterialApp(
    debugShowCheckedModeBanner: false,

        initialRoute: RoutesName.bottomNav,

        onGenerateRoute: Routes.generateRoute,


      )));
}