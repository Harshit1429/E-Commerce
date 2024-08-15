import 'package:ecommerce/view/Bottom_Nav_Bar_Page.dart';
import 'package:ecommerce/view/HomePage.dart';
import 'package:ecommerce/view/Wishlist_Page.dart';
import 'package:flutter/material.dart';
import 'Routes_name.dart';

class Routes{

  static MaterialPageRoute generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomePage(),);

      case RoutesName.wishList:
        return MaterialPageRoute(builder: (context) => const WishListPage(),);

      case RoutesName.bottomNav :
        return MaterialPageRoute(builder: (context) => const BottomBar(),);

        default:
          return MaterialPageRoute(builder: (_){
            return const Scaffold(
              body: Center(
                child: Text("No routes defined"),
              ),
            );
          });
    }

  }
}