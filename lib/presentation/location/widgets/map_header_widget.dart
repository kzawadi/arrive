import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_events_flutter/at_events_flutter.dart';
import 'package:at_events_flutter/common_components/bottom_sheet.dart';
import 'package:at_location_flutter/at_location_flutter.dart';
// import 'package:at_location_flutter/common_components/tasks.dart';
import 'package:at_onboarding_flutter/services/size_config.dart';
import 'package:atsign_location_app/presentation/location/widgets/tasks_launcher_widget.dart';
import 'package:atsign_location_app/shared/colors.dart';
import 'package:atsign_location_app/shared/common_components/iconly_icon.dart';
import 'package:atsign_location_app/shared/common_components/icons_curved.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:flutter/material.dart';

class MapHeaderWidget extends StatelessWidget {
  const MapHeaderWidget({Key? key, required this.controller}) : super(key: key);

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: 85.toHeight,
      width: SizeConfig().screenWidth! * 0.95,
      margin:
          EdgeInsets.symmetric(horizontal: 10.toWidth, vertical: 10.toHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AllColors().DARK_GREY,
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Tasks(
            path: IconlyCurved.Calendar,
            task: TextStrings.createEvent,
            color: Theme.of(context).primaryColor,
            onTap: () {
              Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => CreateEvent(
                    AtClientManager.getInstance(),
                  ),
                ),
              );
            },
          ),
          Tasks(
            path: IconlyCurved.Send,
            task: TextStrings.requestLocation,
            color: Theme.of(context).primaryColor,
            angle: -3.14 / 10,
            size: 22,
            onTap: () async {
              bottomSheet(
                context,
                const RequestLocationSheet(),
                500.toHeight,
                onSheetCLosed: () {
                  controller.animateTo(1);
                },
              );
            },
          ),
          Tasks(
            path: IconlyCurved.AddUser,
            task: TextStrings.shareLocation,
            color: Theme.of(context).primaryColor,
            onTap: () {
              bottomSheet(
                context,
                const ShareLocationSheet(),
                600.toHeight,
                onSheetCLosed: () {
                  controller.animateTo(1);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
