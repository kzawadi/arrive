// ignore_for_file: lines_longer_than_80_chars

import 'package:at_common_flutter/services/size_config.dart';
import 'package:at_events_flutter/at_events_flutter.dart';
import 'package:at_events_flutter/common_components/bottom_sheet.dart';
// import 'package:at_events_flutter/models/event_key_location_model.dart';
import 'package:at_events_flutter/models/event_notification.dart';
import 'package:at_events_flutter/screens/map_screen/events_collapsed_content.dart';
import 'package:at_location_flutter/common_components/pop_button.dart';
import 'package:at_onboarding_flutter/widgets/custom_appbar.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/shared/colors.dart';
import 'package:atsign_location_app/shared/common_components/dialog_box/delete_dialog_confirmation.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:provider/provider.dart';

class EventLog extends StatefulWidget {
  const EventLog({Key? key}) : super(key: key);

  @override
  _EventLogState createState() => _EventLogState();
}

class _EventLogState extends State<EventLog>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: TextStrings.events,
        actionItems: const [
          PopButton(label: TextStrings.close),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig().screenHeight - (80.toHeight),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                  child: TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorWeight: 3.toHeight,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: AllColors().DARK_GREY,
                    controller: _controller,
                    tabs: [
                      Tab(
                        child: Text(
                          TextStrings.upcoming,
                          style:
                              TextStyle(fontSize: 16.toFont, letterSpacing: 1),
                        ),
                      ),
                      Tab(
                        child: Text(
                          TextStrings.past,
                          style: TextStyle(
                            fontSize: 16.toFont,
                            letterSpacing: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    children: [getUpcomingEvents(), getPastEvents()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getUpcomingEvents() {
    final List<EventNotificationModel?> upcomingEvents = EventKeyStreamService()
        .allEventNotifications
        .map((e) => e.eventNotificationModel)
        .toList();
    return ListView.separated(
      itemCount: upcomingEvents.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.15,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: TextStrings.delete,
              color: AllColors().RED,
              icon: Icons.delete,
              onTap: () async {
                await deleteDialogConfirmation(
                  upcomingEvents[index]! as EventAndLocationHybrid,
                );
                setState(() {});
              },
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
            child: InkWell(
              onTap: () {
                HomeEventService().onEventModelTap(
                  // ignore: avoid_dynamic_calls
                  upcomingEvents[index]!,
                  upcomingEvents[index]!.isCancelled!,
                );
              },
              child: DisplayTile(
                title: upcomingEvents[index]!.title,
                atsignCreator: upcomingEvents[index]!.atsignCreator,
                subTitle:
                    '${TextStrings.eventOn} ${dateToString(upcomingEvents[index]!.event!.date!)}',
                invitedBy:
                    '${TextStrings.invitedBy} ${upcomingEvents[index]!.atsignCreator}',
              ),
            ),
          ),
        );
      },
    );
  }

  Widget getPastEvents() {
    final pastEvents = EventKeyStreamService()
        .allPastEventNotifications
        .map((e) => e.eventNotificationModel)
        .toList();
    return ListView.separated(
      itemCount: pastEvents.length,
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actionExtentRatio: 0.15,
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: TextStrings.delete,
              color: AllColors().RED,
              icon: Icons.delete,
              onTap: () async {
                await deleteDialogConfirmation(
                  EventAndLocationHybrid(
                    NotificationModelType.eventModel,
                    eventKeyModel: EventKeyLocationModel(
                      eventNotificationModel: pastEvents[index],
                    ),
                  ),
                );
                setState(() {});
              },
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
            child: InkWell(
              onTap: () {
                bottomSheet(
                  context,
                  EventsCollapsedContent(
                    pastEvents[index]!,
                    key: UniqueKey(),
                    isStatic: true,
                  ),
                  300,
                  onSheetCLosed: () {},
                );
              },
              child: DisplayTile(
                title: pastEvents[index]!.title,
                atsignCreator: pastEvents[index]!.atsignCreator,
                subTitle:
                    '${TextStrings.eventOn} ${dateToString(pastEvents[index]!.event!.date!)}',
                invitedBy:
                    '${TextStrings.invitedBy} ${pastEvents[index]!.atsignCreator}',
              ),
            ),
          ),
        );
      },
    );
  }
}
