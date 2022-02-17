import 'dart:async';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_common_flutter/services/size_config.dart';
import 'package:at_events_flutter/at_events_flutter.dart';
import 'package:at_events_flutter/models/event_notification.dart';
import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:at_location_flutter/common_components/floating_icon.dart';
import 'package:at_location_flutter/common_components/tasks.dart';
import 'package:at_location_flutter/map_content/flutter_map/flutter_map.dart'
    as flutter_map;
import 'package:at_location_flutter/map_content/flutter_map/src/map/map.dart';
import 'package:at_location_flutter/service/home_screen_service.dart';
import 'package:at_location_flutter/utils/constants/colors.dart';
import 'package:at_location_flutter/utils/constants/constants.dart'
    as location_package_constants;
import 'package:atsign_location_app/application/location/bloc/location_bloc.dart';
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/infrastructure/location/location_facade.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/location/flutter_map_wrapper.dart';
import 'package:atsign_location_app/presentation/routes/router.gr.dart'
    as app_router;
import 'package:atsign_location_app/shared/common_components/bottom_sheet.dart';
import 'package:atsign_location_app/shared/common_components/dialog_box/delete_dialog_confirmation.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:atsign_location_app/shared/images.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:atsign_location_app/shared/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_map/flutter_map.dart' as fm;
import 'package:atsign_location_app/presentation/location/widgets/show_location.dart'
    as show_location;

enum FilterScreenType { event, location }
enum EventFilters { Sent, Received, None }
enum LocationFilters { Pending, Sent, Received, None }

class LocationViewer extends StatefulWidget {
  const LocationViewer({Key? key, this.mapController}) : super(key: key);
  final MapController? mapController;

  @override
  State<LocationViewer> createState() => _LocationViewerState();
}

class _LocationViewerState extends State<LocationViewer>
    with SingleTickerProviderStateMixin {
  EventFilters _eventFilter = EventFilters.None;

  LocationFilters _locationFilter = LocationFilters.None;

  PanelController pc = PanelController();
  late fm.MapController fmc;
  // late MapController _mapController;
  // flutter_map.MapController _mapController = flutter_map.MapController();

  late TabController _controller;
  bool? contactsLoaded, moveMap;
  // final _appRouter = app_router.Router();
  // final Completer<Null> _readyCompleter = Completer<Null>();
  MapController? mapc;
  Function? setFilterIconState;
  Function? setFloatingActionState;
  int eventsRenderedWithFilter = 0, locationsRenderedWithFilter = 0;

  late Completer<MapController> controllerCompleter = Completer();

  void _onMapCreated(MapController controller) async {
    controllerCompleter.complete(controller);
  }

  @override
  // ignore: avoid_void_async
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
      // initialIndex: 0,
    );

    fmc = fm.MapController();

    setState(() {
      mapc = MapController();
      // globals.mapController = mapController;
    });
    // _mapController = flutter_map.MapController();

    // mapc = MapController();

    _controller.addListener(() {
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
    });

    // var mapc = MapController();
    // var y = mapc.runtimeType as MapController;
    // await mapc.then((value) => null)
    // context.read<LocationBloc>().add(
    //       LocationEvent.started(_appRouter.navigatorKey),
    //     );
  }

  // to re-render this when tab bar's index change

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocBuilder<LocationBloc, LocationState>(
      // listener: (context, state) {
      // state.mapOrNull(
      //   initial: (_) async {
      //     await Future<void>.delayed(const Duration(seconds: 7))
      //         .then((value) {
      //       context.read<LocationBloc>().add(
      //             const LocationEvent.locationServicesInitialized(),
      //           );
      //     });
      //   },
      // );
      // },
      builder: (context, state) {
        return state.maybeWhen(
          initial: () => const Center(
            child: Scaffold(
              body: Center(
                child: AutoSizeText('INITIALIZING'),
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
            mapContrer,
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
              // setState(() {});
            }
            final mc = getIt<MapControllerImpl>();
            print(Constants.mapKey);
            return Scaffold(
              // endDrawer: Container(
              //   width: 250.toWidth,
              // child: SideBar(),
              // ),
              floatingActionButton: StatefulBuilder(
                builder: (_context, _setFloatingActionState) {
                  setFloatingActionState =
                      _setFloatingActionState; // to re-render this when tab bar's index change
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
                      // FlutterMapWrapper(
                      //   mapKey: mapKey,
                      //   moveMap: moveMap!,
                      //   location: positionStream.fold(
                      //     () => LatLng(45, 45),
                      //     (a) {
                      //       return LatLng(a.latitude, a.longitude);
                      //     },
                      //   ),
                      // )
                      // showLocation(
                      //   mapKey,
                      //   mapContrer,
                      //   location:
                      // positionStream.fold(() => null, (a) {
                      //     return LatLng(a.latitude, a.longitude);
                      //   }),
                      //   moveMap: moveMap ?? false,
                      // )
                      show_location.showLocation(
                        mapKey,
                        fmc,
                        location: positionStream.fold(
                          () => null,
                          (a) {
                            return LatLng(a.latitude, a.longitude);
                          },
                        ),
                      )
                    // fm.FlutterMap(
                    //   options: fm.MapOptions(
                    //     center:
                    // positionStream.fold(
                    //       () => null,
                    //       (a) {
                    //         return LatLng(a.latitude, a.longitude);
                    //       },
                    //     ),
                    //   ),
                    //   mapController: fmc,
                    //   layers: [
                    //     fm.TileLayerOptions(
                    //       urlTemplate:
                    //           'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //       subdomains: ['a', 'b', 'c'],
                    //       attributionBuilder: (_) {
                    //         return const Text('© OpenStreetMap contributors');
                    //       },
                    //     ),
                    //     fm.MarkerLayerOptions(
                    //       markers: [
                    //         fm.Marker(
                    //           width: 80.0,
                    //           height: 80.0,
                    //           point: LatLng(51.5, -0.09),
                    //           builder: (ctx) => Container(
                    //             child: FlutterLogo(),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // )
                    else
                      showLocation(
                        mapKey,
                        mapContrer,
                        moveMap: moveMap ?? false,
                      ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: SizedBox(
                        height: 55.toHeight,
                        child: FloatingIcon(
                          bgColor: Theme.of(context).primaryColor,
                          icon: Icons.table_rows,
                          iconColor: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 264.toHeight,
                      child: header(
                        context,
                        _controller,
                      ),
                    ),
                    if (positionStream.isSome())
                      Positioned(
                        top: 100,
                        right: 0,
                        child: FloatingIcon(
                          icon: Icons.zoom_out_map,
                          onPressed: () {
                            // if (widget.mapController!.ready) {

                            fmc.move(
                              positionStream.fold(
                                () => LatLng(45, 45),
                                (a) =>
                                    //  {
                                    LatLng(a.latitude, a.longitude),
                                // },
                              ),
                              8,
                            );
                            // }
                            //todo zoomOutFn event
                          },
                        ),
                      )
                    else
                      const SizedBox(),
                    if (contactsLoaded!)
                      SlidingUpPanel(
                        controller: pc,
                        minHeight: 267.toHeight,
                        maxHeight: 530.toHeight,
                        panelBuilder: (scrollController) {
                          print('builder called uppanel');
                          if (animateToIndex != -1) {
                            // setFilterIconState will help to avoid position changing when tabbar is not built
                            _controller.animateTo(animateToIndex!);
                          }

                          if (allEventNotifications!.isNotEmpty ||
                              allLocationNotifications!.isNotEmpty) {
                            return collapsedContent(
                              context,
                              false,
                              scrollController,
                              renderEventsAndLocation(
                                context,
                                allEventNotifications,
                                allLocationNotifications!,
                                scrollController,
                                _controller,
                                setFilterIconState!,
                              ),
                            );
                          } else {
                            return collapsedContent(
                              context,
                              false,
                              scrollController,
                              emptyWidget(TextStrings.noDataFound),
                            );
                          }
                        },
                      )
                    else
                      Container(
                        child: SlidingUpPanel(
                          controller: pc,
                          minHeight: 267.toHeight,
                          maxHeight: 530.toHeight,
                          panelBuilder: (scrollController) => collapsedContent(
                            context,
                            false,
                            scrollController,
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
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

  Widget header(BuildContext context, TabController controller) {
    return Container(
      height: 85.toHeight,
      width: SizeConfig().screenWidth * 0.95,
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
              task: TextStrings.createEvent,
              icon: Icons.event,
              onTap: () {
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (context) => CreateEvent(
                      AtClientManager.getInstance(),
                    ),
                  ),
                );
              }),
          Tasks(
              task: TextStrings.requestLocation,
              icon: Icons.sync,
              angle: (-3.14 / 2),
              onTap: () async {
                bottomSheet(context, RequestLocationSheet(), 500.toHeight,
                    onSheetCLosed: () {
                  controller.animateTo(1);
                });
              }),
          Tasks(
              task: TextStrings.shareLocation,
              icon: Icons.person_add,
              onTap: () {
                bottomSheet(context, const ShareLocationSheet(), 600.toHeight,
                    onSheetCLosed: () {
                  controller.animateTo(1);
                });
              })
        ],
      ),
    );
  }

  Widget renderEventsAndLocation(
    BuildContext context,
    List<EventAndLocationHybrid> eventNotifications,
    List<EventAndLocationHybrid> locationNotifications,
    ScrollController scrollController,
    TabController controller,
    Function setFilterIconState,
  ) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                child: TabBar(
                  key: Key(TextStrings.tabbar),
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorWeight: 3.toHeight,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: AllColors().DARK_GREY,
                  controller: controller,
                  tabs: [
                    Tab(
                      child: Text(
                        TextStrings.events,
                        style: TextStyle(fontSize: 16.toFont, letterSpacing: 1),
                      ),
                    ),
                    Tab(
                      child: Text(TextStrings.locations,
                          style:
                              TextStyle(fontSize: 16.toFont, letterSpacing: 1)),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _openFilterDialog(controller.index == 0
                    ? FilterScreenType.event
                    : FilterScreenType.location);
              },
              child: StatefulBuilder(
                builder: (_context, _setFilterIconState) {
                  setFilterIconState =
                      _setFilterIconState; // to re-render this when tab bar's index change

                  return Icon(Icons.filter_alt,
                      size: 25.toFont,
                      color: isFilterApplied(controller)
                          ? AllColors().ORANGE
                          : Colors.black);
                },
              ),
            )
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: renderEvents(eventNotifications, scrollController),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: renderLocations(locationNotifications, scrollController),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget renderEvents(
    List<EventAndLocationHybrid> eventNotifications,
    ScrollController scrollController,
  ) {
    if (eventNotifications.isNotEmpty) {
      final _list = getListView(
          eventNotifications, scrollController, FilterScreenType.event);

      /// after rendering events, we will have [eventsRenderedWithFilter] count
      if ((_eventFilter != EventFilters.None) &&
          (eventsRenderedWithFilter == 0)) {
        return emptyWidget(
            '${TextStrings.noWithoutSpecialcharacters} ${_eventFilter.name} ${TextStrings.eventData}');
      }

      return _list;
    } else {
      return emptyWidget(TextStrings.noDataFound);
    }
  }

  Widget renderLocations(List<EventAndLocationHybrid> locationNotifications,
      ScrollController scrollController) {
    if (locationNotifications.isNotEmpty) {
      final _list = getListView(
          locationNotifications, scrollController, FilterScreenType.location);

      /// after rendering locations, we will have [locationsRenderedWithFilter] count

      if ((_locationFilter != LocationFilters.None) &&
          (locationsRenderedWithFilter == 0)) {
        return emptyWidget(
            '${TextStrings.noWithoutSpecialcharacters} ${_locationFilter.name} ${TextStrings.locationData}');
      }

      return _list;
    } else {
      return emptyWidget(TextStrings.noDataFound);
    }
  }

  /// We will filter data while rendering it, using [shouldCurrentHybridBeRendered]
  /// and use [eventsRenderedWithFilter]/[locationsRenderedWithFilter] to keep count of elements rendered
  Widget getListView(
    List<EventAndLocationHybrid> allHybridNotifications,
    ScrollController slidingScrollController,
    FilterScreenType filterScreenType,
  ) {
    if (filterScreenType == FilterScreenType.event) {
      eventsRenderedWithFilter = 0;
    } else {
      locationsRenderedWithFilter = 0;
    }

    try {
      return ListView(
        children: allHybridNotifications.map<Widget>((hybridElement) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.15,
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: TextStrings.delete,
                color: AllColors().RED,
                icon: Icons.delete,
                onTap: () {
                  deleteDialogConfirmation(hybridElement);
                },
              ),
            ],
            child: shouldCurrentHybridBeRendered(hybridElement)
                ? Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (hybridElement.type ==
                              NotificationModelType.eventModel) {
                            HomeEventService().onEventModelTap(
                                hybridElement
                                    .eventKeyModel!.eventNotificationModel!,
                                hybridElement.eventKeyModel!.haveResponded);
                          } else {
                            HomeScreenService().onLocationModelTap(
                              hybridElement
                                  .locationKeyModel!.locationNotificationModel!,
                              hybridElement.locationKeyModel!.haveResponded!,
                            );
                          }
                        },
                        child: DisplayTile(
                          //todo key is no longer needed WHY
                          // key: Key(
                          //   hybridElement.type ==
                          //           NotificationModelType.eventModel
                          //       ? hybridElement
                          //           .eventKeyModel!.eventNotificationModel!.key!
                          //       : hybridElement.locationKeyModel!
                          //           .locationNotificationModel!.key!,
                          // ),
                          atsignCreator: hybridElement.type ==
                                  NotificationModelType.eventModel
                              ? hybridElement.eventKeyModel!
                                  .eventNotificationModel!.atsignCreator
                              : (hybridElement
                                          .locationKeyModel!
                                          .locationNotificationModel!
                                          .atsignCreator ==
                                      AtClientManager.getInstance()
                                          .atClient
                                          .getCurrentAtSign()
                                  ? hybridElement.locationKeyModel!
                                      .locationNotificationModel!.receiver
                                  : hybridElement
                                      .locationKeyModel!
                                      .locationNotificationModel!
                                      .atsignCreator),
                          number: hybridElement.type ==
                                  NotificationModelType.eventModel
                              ? hybridElement
                                  .eventKeyModel!
                                  .eventNotificationModel!
                                  .group!
                                  .members!
                                  .length
                              : null,
                          title: hybridElement.type ==
                                  NotificationModelType.eventModel
                              ? TextStrings.event +
                                  hybridElement.eventKeyModel!
                                      .eventNotificationModel!.title!
                              : getTitle(
                                  hybridElement.locationKeyModel!
                                      .locationNotificationModel!,
                                ),
                          subTitle: hybridElement.type ==
                                  NotificationModelType.eventModel
                              ? HomeEventService().getSubTitle(
                                  hybridElement
                                      .eventKeyModel!.eventNotificationModel!,
                                )
                              : getSubTitle(
                                  hybridElement.locationKeyModel!
                                      .locationNotificationModel!,
                                ),
                          semiTitle: hybridElement.type ==
                                  NotificationModelType.eventModel
                              ? HomeEventService().getSemiTitle(
                                  hybridElement
                                      .eventKeyModel!.eventNotificationModel!,
                                  hybridElement.eventKeyModel!.haveResponded,
                                )
                              : getSemiTitle(
                                  hybridElement.locationKeyModel!
                                      .locationNotificationModel!,
                                  hybridElement
                                      .locationKeyModel!.haveResponded!,
                                ),
                          showRetry: hybridElement.type ==
                                  NotificationModelType.eventModel
                              ? HomeEventService().calculateShowRetry(
                                  hybridElement.eventKeyModel!,
                                )
                              : calculateShowRetry(
                                  hybridElement.locationKeyModel!,
                                ),
                          onRetryTapped: () {
                            if (hybridElement.type ==
                                NotificationModelType.eventModel) {
                              HomeEventService().onEventModelTap(
                                hybridElement
                                    .eventKeyModel!.eventNotificationModel!,
                                false,
                              );
                            } else {
                              HomeScreenService().onLocationModelTap(
                                hybridElement.locationKeyModel!
                                    .locationNotificationModel!,
                                false,
                              );
                            }
                          },
                        ),
                      ),
                      const Divider()
                    ],
                  )
                : const SizedBox(),
          );
        }).toList(),
      );
    } catch (e) {
      print('${TextStrings.errorInGetListView} $e');
      return emptyWidget(
          '${TextStrings.somethingWentWrongPleaseTryAgain} ${e.toString()}');
    }
  }

  bool shouldCurrentHybridBeRendered(
      EventAndLocationHybrid eventAndLocationHybrid) {
    if (eventAndLocationHybrid.type == NotificationModelType.eventModel) {
      final _shouldCurrentEventBeRendered = shouldCurrentEventBeRendered(
        eventAndLocationHybrid.eventKeyModel!.eventNotificationModel!,
      );
      if (_shouldCurrentEventBeRendered) {
        eventsRenderedWithFilter++;
      }
      return _shouldCurrentEventBeRendered;
    }

    final _shouldCurrentLocationBeRendered = shouldCurrentLocationBeRendered(
      eventAndLocationHybrid.locationKeyModel!.locationNotificationModel!,
    );
    if (_shouldCurrentLocationBeRendered) {
      locationsRenderedWithFilter++;
    }
    return _shouldCurrentLocationBeRendered;
  }

  bool shouldCurrentEventBeRendered(
    EventNotificationModel eventNotificationModel,
  ) {
    switch (_eventFilter) {
      case EventFilters.None:
        return true;

      case EventFilters.Sent:
        return compareAtSign(
          eventNotificationModel.atsignCreator!,
          AtClientManager.getInstance().atClient.getCurrentAtSign()!,
        );

      case EventFilters.Received:
        return !compareAtSign(
          eventNotificationModel.atsignCreator!,
          AtClientManager.getInstance().atClient.getCurrentAtSign()!,
        );
    }
  }

  bool shouldCurrentLocationBeRendered(
      LocationNotificationModel locationNotificationModel) {
    switch (_locationFilter) {
      case LocationFilters.None:
        return true;

      case LocationFilters.Pending:
        {
          if (locationNotificationModel.key!.contains(
              location_package_constants.MixedConstants.SHARE_LOCATION)) {
            return false;
          } else {
            if ((locationNotificationModel.isAccepted == false) &&
                (locationNotificationModel.isExited == false)) {
              return true;
            }
          }

          return false;
        }
      case LocationFilters.Sent:
        return locationNotificationModel.key!.contains(
                location_package_constants.MixedConstants.SHARE_LOCATION)
            ? compareAtSign(
                locationNotificationModel.atsignCreator!,
                AtClientManager.getInstance().atClient.getCurrentAtSign()!,
              )
            : compareAtSign(
                locationNotificationModel.receiver!,
                AtClientManager.getInstance().atClient.getCurrentAtSign()!,
              );
      case LocationFilters.Received:
        return locationNotificationModel.key!.contains(
                location_package_constants.MixedConstants.SHARE_LOCATION)
            ? compareAtSign(
                locationNotificationModel.receiver!,
                AtClientManager.getInstance().atClient.getCurrentAtSign()!,
              )
            : compareAtSign(locationNotificationModel.atsignCreator!,
                AtClientManager.getInstance().atClient.getCurrentAtSign()!);
    }
  }

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

  Widget emptyWidget(String title) {
    return Column(
      children: [
        Image.asset(
          AllImages().EMPTY_GROUP,
          width: 181.toWidth,
          height: 181.toWidth,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 15.toHeight,
        ),
        Text(title, style: CustomTextStyles().grey16),
        SizedBox(
          height: 5.toHeight,
        ),
      ],
    );
  }

  Widget collapsedContent(
    BuildContext context,
    bool isExpanded,
    ScrollController slidingScrollController,
    Widget T, {
    Key? key,
  }) {
    return Container(
      key: key,
      height: !isExpanded ? 260.toHeight : 530.toHeight,
      padding: EdgeInsets.fromLTRB(15.toWidth, 7.toHeight, 0, 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: AllColors().DARK_GREY,
            blurRadius: 10,
            spreadRadius: 1.0,
            // offset: const Offset(0.0, 0.0),
          )
        ],
      ),
      child: T,
    );
  }

  Future<void> _openFilterDialog(FilterScreenType _filterScreenType) {
    return showDialog<void>(
      context: NavService.navKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (_context, _setDialogState) {
            return AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${TextStrings.filter} ${_filterScreenType.name}s',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 15)),
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
                            // Provider.of<LocationProvider>(context, listen: false)
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
