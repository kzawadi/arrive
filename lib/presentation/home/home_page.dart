import 'package:atsign_location_app/presentation/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.atSign}) : super(key: key);

  final String atSign;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).navigate(
                ContactsScreenRoute(
                  key: key,
                  asSingleSelectionScreen: false,
                  context: context,
                  onSendIconPressed: () {},

                  // saveGroup: () {},
                  // selectedList: (f) {},
                ),
              );
            },
            child: const Text('CONTACTS'),
          ),
          AutoSizeText(' @sign on boarded is ||| $atSign  |||'),
          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).navigate(const LocationPageRoute());
            },
            child: const AutoSizeText('MAP'),
          )
        ],
      ),
    );
  }
}
