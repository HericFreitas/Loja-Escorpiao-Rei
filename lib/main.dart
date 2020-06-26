import 'package:flutter/material.dart';
import 'package:lojaescorpiaorei/models/admin_orders_manager.dart';
import 'package:lojaescorpiaorei/models/admin_users_manager.dart';
import 'package:lojaescorpiaorei/models/cart_manager.dart';
import 'package:lojaescorpiaorei/models/home_manager.dart';
import 'package:lojaescorpiaorei/models/order.dart';
import 'package:lojaescorpiaorei/models/orders_manager.dart';
import 'package:lojaescorpiaorei/models/product.dart';
import 'package:lojaescorpiaorei/models/product_manager.dart';
import 'package:lojaescorpiaorei/models/user_manager.dart';
import 'package:lojaescorpiaorei/screens/base/base_screen.dart';
import 'package:lojaescorpiaorei/screens/cart/cart_screen.dart';
import 'package:lojaescorpiaorei/screens/checkout/checkout_screen.dart';
import 'package:lojaescorpiaorei/screens/confirmation/confirmation_screen.dart';
import 'package:lojaescorpiaorei/screens/edit_product/edit_product_screen.dart';
import 'package:lojaescorpiaorei/screens/login/login_screen.dart';
import 'package:lojaescorpiaorei/screens/product/product_screen.dart';
import 'package:lojaescorpiaorei/screens/select_product/select_product_screen.dart';
import 'package:lojaescorpiaorei/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProductManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => HomeManager(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
            cartManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, OrdersManager>(
          create: (_) => OrdersManager(),
          lazy: false,
          update: (_, userManager, ordersManager) =>
            ordersManager..updateUser(userManager.user),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminUsersManager>(
          create: (_) => AdminUsersManager(),
          lazy: false,
          update: (_, userManager, adminUsersManager) =>
            adminUsersManager..updateUser(userManager),
        ),
        ChangeNotifierProxyProvider<UserManager, AdminOrdersManager>(
          create: (_) => AdminOrdersManager(),
          lazy: false,
          update: (_, userManager, adminOrdersManager) =>
            adminOrdersManager..updateAdmin(
              adminEnabled: userManager.adminEnabled
            ),
        )
      ],
      child: MaterialApp(
        title: 'Loja do Daniel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 255, 255, 70),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 65),
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                  builder: (_) => LoginScreen()
              );
            case '/signup':
              return MaterialPageRoute(
                  builder: (_) => SignUpScreen()
              );
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(
                    settings.arguments as Product
                  )
              );
            case '/cart':
              return MaterialPageRoute(
                builder: (_) => CartScreen(),
                settings: settings
              );
            case '/checkout':
              return MaterialPageRoute(
                  builder: (_) => CheckoutScreen()
              );
            case '/edit_product':
              return MaterialPageRoute(
                  builder: (_) => EditProductScreen(
                    settings.arguments as Product
                  )
              );
            case '/select_product':
              return MaterialPageRoute(
                  builder: (_) => SelectProductScreen()
              );
            case '/confirmation':
              return MaterialPageRoute(
                  builder: (_) => ConfirmationScreen(
                    settings.arguments as Order
                  )
              );
            case '/':
            default:
              return MaterialPageRoute(
                builder: (_) => BaseScreen(),
                settings: settings
              );
          }
        },
      ),
    );
  }
}
