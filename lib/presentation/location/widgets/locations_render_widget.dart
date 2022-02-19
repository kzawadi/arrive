import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/presentation/location/widgets/empty_widget.dart';
import 'package:atsign_location_app/presentation/location/widgets/list_view_widget.dart';
import 'package:atsign_location_app/shared/enums.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:flutter/material.dart';

class LocationRenderWidget extends StatelessWidget {
  const LocationRenderWidget({
    Key? key,
    required this.locationNotifications,
    required this.scrollController,
    required this.filterScreenType,
    required this.locationtFilter,
    this.eventsRenderedWithFilter = 0,
    this.locationsRenderedWithFilter = 0,
  }) : super(key: key);

  final List<EventAndLocationHybrid>? locationNotifications;
  final ScrollController scrollController;
  final FilterScreenType filterScreenType;
  final LocationFilters locationtFilter;
  final int eventsRenderedWithFilter, locationsRenderedWithFilter;
  @override
  Widget build(BuildContext context) {
    if (locationNotifications!.isNotEmpty) {
      final _list = ListViewWidget(
        allHybridNotifications: locationNotifications!,
        slidingScrollController: scrollController,
        filterScreenType: filterScreenType,
        locationFilters: locationtFilter,

        // eventNotifications,
        // scrollController,
        // FilterScreenType.event,
      );

      /// after rendering events, we will have [eventsRenderedWithFilter] count
      if ((locationtFilter != LocationFilters.None) &&
          (eventsRenderedWithFilter == 0)) {
        return EmptyWidget(
          title:
              '${TextStrings.noWithoutSpecialcharacters} ${locationtFilter.name} ${TextStrings.eventData}',
        );
      }

      return _list;
    } else {
      return const EmptyWidget(title: TextStrings.noDataFound);
    }
  }
}
