import 'package:flutter/material.dart';
import 'package:lojaescorpiaorei/common/custom_drawer/custom_drawer_header.dart';
import 'package:lojaescorpiaorei/common/custom_drawer/drawer_tile.dart';
import 'package:lojaescorpiaorei/models/user_manager.dart';
import 'package:lojaescorpiaorei/common/custom_drawer/custom_drawer_header.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 65),
                Color.fromARGB(255, 0, 0, 170)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(),
              DrawerTile(
                iconData: Icons.home,
                title: 'Início',
                page: 0,
              ),
              DrawerTile(
                iconData: Icons.list,
                title: 'Produtos',
                page: 1,
              ),
              DrawerTile(
                iconData: Icons.local_offer,
                title: 'Meus Pedidos',
                page: 2,
              ),
              Consumer<UserManager>(
                builder: (_, userManager, __) {
                  if (userManager.adminEnabled) {
                    return Column(
                      children: <Widget>[
                        const Divider(),
                        DrawerTile(
                          iconData: Icons.history,
                          title: 'Histórico de vendas',
                          page: 4,
                        ),
                        DrawerTile(
                          iconData: Icons.settings,
                          title: 'Usuários',
                          page: 3,
                        ),
                        
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
