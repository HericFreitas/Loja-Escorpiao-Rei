import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lojaescorpiaorei/models/page_manager.dart';
import 'package:lojaescorpiaorei/models/user_manager.dart';
import 'package:lojaescorpiaorei/screens/admin_orders/admin_orders_screen.dart';
import 'package:lojaescorpiaorei/screens/admin_users/admin_users_screen.dart';
import 'package:lojaescorpiaorei/screens/home/home_screen.dart';
import 'package:lojaescorpiaorei/screens/orders/orders_screen.dart';
import 'package:lojaescorpiaorei/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: Consumer<UserManager>(
        builder: (_, userManager, __){
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              ProductsScreen(),
              OrdersScreen(),
              if(userManager.adminEnabled)
                ...[
                  AdminUsersScreen(),
                  AdminOrdersScreen(),
                ]
            ],
          );
        },
      ),
    );
  }
}
