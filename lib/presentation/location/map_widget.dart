// ignore_for_file: avoid_print

import 'dart:async';

import 'package:at_common_flutter/services/size_config.dart';
import 'package:at_location_flutter/utils/constants/colors.dart';
import 'package:atsign_location_app/application/location/bloc/location_bloc.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/presentation/home/drawer.dart';
import 'package:atsign_location_app/presentation/location/compass/compas_view.dart';
import 'package:atsign_location_app/presentation/location/widgets/action_button.dart';
import 'package:atsign_location_app/presentation/location/widgets/collapsed_content_widget.dart';
import 'package:atsign_location_app/presentation/location/widgets/empty_widget.dart';
import 'package:atsign_location_app/presentation/location/widgets/event_render_widget.dart';
import 'package:atsign_location_app/presentation/location/widgets/locations_render_widget.dart';
import 'package:atsign_location_app/presentation/location/widgets/map_header_widget.dart';
import 'package:atsign_location_app/presentation/location/widgets/map.dart'
    as show_location;
import 'package:atsign_location_app/presentation/routes/router.gr.dart';
import 'package:atsign_location_app/shared/common_components/iconly_icon.dart';
import 'package:atsign_location_app/shared/common_components/icons_curved.dart';
import 'package:atsign_location_app/shared/enums.dart';
import 'package:atsign_location_app/shared/images.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LocationViewer extends StatefulWidget {
  const LocationViewer({Key? key}) : super(key: key);

  @override
  State<LocationViewer> createState() => _LocationViewerState();
}

class _LocationViewerState extends State<LocationViewer>
    with SingleTickerProviderStateMixin {
  EventFilters _eventFilter = EventFilters.None;

  LocationFilters _locationFilter = LocationFilters.None;

  late PanelController _panelController;
  late fm.MapController _mapController;

  late TabController _controller;
  bool? contactsLoaded, moveMap;
  Function? setFilterIconState;
  Function? setFloatingActionState;
  int eventsRenderedWithFilter = 0, locationsRenderedWithFilter = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
      // initialIndex: 0,
    );
    //UI controllers
    _mapController = fm.MapController();
    _panelController = PanelController();

    _controller.addListener(
      () {
        if (mounted) {
          if (setFilterIconState != null) {
            try {
              // ignore: avoid_dynamic_calls
              setFilterIconState!(
                () {},
              ); // to re-render this when tab bar's index change
            } catch (e) {
              print('Error in setFilterIconState $e');
            }
          }

          if (setFloatingActionState != null) {
            try {
              // ignore: avoid_dynamic_calls
              setFloatingActionState!(
                () {},
              ); // to re-render this when tab bar's index change
            } catch (e) {
              print('Error in setFloatingActionState $e');
            }
          }
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const Scaffold(
            body: Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          orElse: () => const Center(
            child: AutoSizeText('no map data yeet'),
          ),
          showingMap: (
            myLatLn,
            previusLatLng,
            contactsLoaded,
            moveMap,
            mapKey,
            positionStream,
            allNotifications,
            allLocationNotifications,
            allEventNotifications,
            animateToIndex,
          ) {
            if (positionStream.isSome()) {
              if (moveMap == null) {
                moveMap = true;
              } else {
                moveMap = false;
              }
            }
            return Scaffold(
              endDrawer: SizedBox(
                width: 250.toWidth,
                child: const SideDrawer(),
              ),
              floatingActionButton: StatefulBuilder(
                builder: (_context, _setFloatingActionState) {
                  setFloatingActionState =
                      _setFloatingActionState; // to re-render this when
                  //tab bar's index change
                  return isFilterApplied(_controller)
                      ? InkWell(
                          onTap: () {
                            removeFilter(_controller);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(4.toHeight),
                            child: Image.asset(
                              AllImages().FILTER_ALT_OFF,
                              height: 25.toFont,
                              color: AllColors().ORANGE,
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              ),
              body: SafeArea(
                child: Stack(
                  children: [
                    if (positionStream.isSome())
                      show_location.ArriveMap(
                        // mapKey,
                        mapController: _mapController,
                        location: positionStream.fold(
                          () => null,
                          (a) {
                            return LatLng(a.latitude, a.longitude);
                          },
                        ),
                      )
                    else
                      show_location.ArriveMap(
                        // mapKey,
                        mapController: _mapController,
                        // moveMap: moveMap ?? false,
                      ),
                    //drawer icon
                    Positioned(
                      top: 0,
                      right: 10,
                      child: SizedBox(
                        height: 55.toHeight,
                        child: ArriveActionButton(
                          iconColor: Colors.blueGrey,
                          icon: IconlyIcon(
                            path: IconlyCurved.Category,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          onPressed: () => AutoRouter.of(context).push(
                            const SideDrawerRoute(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 264.toHeight,
                      child: MapHeaderWidget(
                        controller: _controller,
                      ),
                    ),
                    //zooming to current location icon
                    if (positionStream.isSome())
                      Positioned(
                        top: 100,
                        right: 10,
                        child: ArriveActionButton(
                          iconColor: Colors.blueGrey,
                          icon: IconlyIcon(
                            path: IconlyCurved.Discovery,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                          onPressed: () {
                            _mapController.move(
                              positionStream.fold(
                                () => LatLng(45, 45),
                                (a) => LatLng(a.latitude, a.longitude),
                              ),
                              20,
                            );
                          },
                        ),
                      )
                    else
                      const SizedBox(),
                    if (contactsLoaded!)
                      SlidingUpPanel(
                        controller: _panelController,
                        minHeight: 267.toHeight,
                        maxHeight: 530.toHeight,
                        panelBuilder: (scrollController) {
                          print('builder called uppanel');
                          if (animateToIndex != -1 && mounted) {
                            // setFilterIconState will help to avoid
                            // position changing when tabbar is not built
                            _controller.animateTo(animateToIndex!);
                          }

                          if (allEventNotifications!.isNotEmpty ||
                              allLocationNotifications!.isNotEmpty) {
                            return CollapsedContentWidget(
                              slidingScrollController: scrollController,
                              isExpanded: false,
                              child: renderEventsAndLocation(
                                context: context,
                                eventNotifications: allEventNotifications,
                                locationNotifications: allLocationNotifications,
                                scrollController: scrollController,
                              ),
                            );
                          } else {
                            return CollapsedContentWidget(
                              slidingScrollController: scrollController,
                              isExpanded: false,
                              child: const EmptyWidget(
                                title: TextStrings.noDataFound,
                              ),
                            );
                          }
                        },
                      )
                    else
                      SlidingUpPanel(
                        controller: _panelController,
                        minHeight: 267.toHeight,
                        maxHeight: 530.toHeight,
                        panelBuilder: (scrollController) =>
                            CollapsedContentWidget(
                          slidingScrollController: scrollController,
                          isExpanded: false,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),

                    const Positioned(
                      top: 0,
                      left: 0,
                      child: SizedBox(
                        height: 90,
                        width: 90,
                        child: Compass(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          // },
        );
      },
    );
  }

  Widget renderEventsAndLocation({
    BuildContext? context,
    List<EventAndLocationHybrid>? eventNotifications,
    List<EventAndLocationHybrid>? locationNotifications,
    required ScrollController scrollController,
  }) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TabBar(
                  key: const Key(TextStrings.tabbar),
                  indicatorColor: Theme.of(context!).primaryColor,
                  indicatorWeight: 3.toHeight,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: AllColors().DARK_GREY,
                  controller: _controller,
                  tabs: [
                    Tab(
                      child: Text(
                        TextStrings.events,
                        style: TextStyle(fontSize: 16.toFont, letterSpacing: 1),
                      ),
                    ),
                    Tab(
                      child: Text(
                        TextStrings.locations,
                        style: TextStyle(fontSize: 16.toFont, letterSpacing: 1),
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _openFilterDialog(
                  _controller.index == 0
                      ? FilterScreenType.event
                      : FilterScreenType.location,
                );
              },
              child: StatefulBuilder(
                builder: (_context, _setFilterIconState) {
                  setFilterIconState = _setFilterIconState; // to re-render this
                  //when tab bar's index change

                  return Icon(
                    Icons.filter_alt,
                    size: 25.toFont,
                    color: isFilterApplied(_controller)
                        ? AllColors().ORANGE
                        : Colors.black,
                  );
                },
              ),
            )
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: EventRenderWidget(
                  scrollController: scrollController,
                  eventNotifications: eventNotifications,
                  eventFilter: _eventFilter,
                  filterScreenType: FilterScreenType.event,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: LocationRenderWidget(
                  scrollController: scrollController,
                  filterScreenType: FilterScreenType.location,
                  locationtFilter: _locationFilter,
                  locationNotifications: locationNotifications,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  /// We will filter data while
  /// rendering it, using =>shouldCurrentHybridBeRendered
  /// and use [eventsRenderedWithFilter]/[locationsRenderedWithFilter]
  /// to keep count of elements rendered

  void removeFilter(TabController controller) {
    if (controller.index == 0) {
      _eventFilter = EventFilters.None;
    } else {
      _locationFilter = LocationFilters.None;
    }

    // setState(() {});
  }

  bool isFilterApplied(TabController controller) {
    if (controller.index == 0) {
      return _eventFilter != EventFilters.None;
    }

    return _locationFilter != LocationFilters.None;
  }

  Future<void> _openFilterDialog(FilterScreenType _filterScreenType) {
    return showDialog<void>(
      context: AutoRouter.of(context).navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (_context, _setDialogState) {
            return AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${TextStrings.filter} ${_filterScreenType.name}s',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 0.8,
                  )
                ],
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var _filterValue
                        in (_filterScreenType == FilterScreenType.event)
                            ? EventFilters.values
                            : LocationFilters.values)
                      CheckboxListTile(
                        onChanged: (value) {
                          if (_filterScreenType == FilterScreenType.event) {
                            _eventFilter = _filterValue as EventFilters;
                          } else {
                            _locationFilter = _filterValue as LocationFilters;
                          }

                          _setDialogState(() {});
                        },
                        value: (_filterScreenType == FilterScreenType.event)
                            ? (_eventFilter == _filterValue)
                            : (_locationFilter == _filterValue),
                        checkColor: Colors.white,
                        title: Text(_filterValue.name),
                      ),
                    const Divider(thickness: 0.8),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            // Providertext, listen: false)
                            //     .animateToIndex = -1; // reset animateToIndex
                            // setState(() {}); //todo another logic in UI have get fixed
                          },
                          child: const Text(
                            TextStrings.filter,
                            style: TextStyle(
                              color: Colors.pink, //todo this is a simpe fix
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            TextStrings.cancel,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
