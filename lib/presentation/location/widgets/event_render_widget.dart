// ignore_for_file: lines_longer_than_80_chars

import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/presentation/location/widgets/empty_widget.dart';
import 'package:atsign_location_app/presentation/location/widgets/list_view_widget.dart';
import 'package:atsign_location_app/shared/enums.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:flutter/material.dart';

class EventRenderWidget extends StatelessWidget {
  const EventRenderWidget({
    Key? key,
    required this.eventNotifications,
    required this.scrollController,
    required this.filterScreenType,
    required this.eventFilter,
    this.eventsRenderedWithFilter = 0,
    this.locationsRenderedWithFilter = 0,
  }) : super(key: key);
  final List<EventAndLocationHybrid>? eventNotifications;
  final ScrollController scrollController;
  final FilterScreenType filterScreenType;
  final EventFilters eventFilter;
  final int eventsRenderedWithFilter, locationsRenderedWithFilter;

  @override
  Widget build(BuildContext context) {
    if (eventNotifications!.isNotEmpty) {
      final _list = ListViewWidget(
        allHybridNotifications: eventNotifications!,
        slidingScrollController: scrollController,
        filterScreenType: filterScreenType,
        eventFilter: eventFilter,
      );

      /// after rendering events, we will have [eventsRenderedWithFilter] count
      // if ((eventFilter != EventFilters.None) &&
      //     (eventsRenderedWithFilter == 0)) {
      //   return EmptyWidget(
      //     title:
      //         '${TextStrings.noWithoutSpecialcharacters} ${eventFilter.name} ${TextStrings.eventData}',
      //   );
      // }

      return _list;
    } else {
      return const EmptyWidget(title: TextStrings.noDataFound);
    }
  }
}
