// ignore_for_file: lines_longer_than_80_chars, avoid_print

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_events_flutter/at_events_flutter.dart';
import 'package:at_events_flutter/models/event_notification.dart';
import 'package:at_location_flutter/at_location_flutter.dart';
import 'package:at_location_flutter/service/home_screen_service.dart';
import 'package:at_location_flutter/utils/constants/constants.dart'
    as location_package_constants;
import 'package:atsign_location_app/domain/location/models/event_and_location.dart';
import 'package:atsign_location_app/presentation/location/widgets/empty_widget.dart';
import 'package:atsign_location_app/shared/colors.dart';
import 'package:atsign_location_app/shared/common_components/dialog_box/delete_dialog_confirmation.dart';
import 'package:atsign_location_app/shared/enums.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ListViewWidget extends StatelessWidget {
  ListViewWidget({
    Key? key,
    required this.allHybridNotifications,
    required this.slidingScrollController,
    required this.filterScreenType,
    this.eventFilter,
    this.locationFilters,
  }) : super(key: key);

  final List<EventAndLocationHybrid> allHybridNotifications;
  final ScrollController slidingScrollController;
  final FilterScreenType filterScreenType;
  final EventFilters? eventFilter;
  final LocationFilters? locationFilters;
  int eventsRenderedWithFilter = 0, locationsRenderedWithFilter = 0;

  @override
  Widget build(BuildContext context) {
    if (filterScreenType == FilterScreenType.event) {
      eventsRenderedWithFilter = 0;
    } else {
      locationsRenderedWithFilter = 0;
    }

    try {
      return ListView(
        children: allHybridNotifications.map<Widget>((hybridElement) {
          return Slidable(
            actionPane: const SlidableDrawerActionPane(),
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
                              hybridElement.eventKeyModel!.haveResponded,
                            );
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
      return EmptyWidget(
        title:
            '${TextStrings.somethingWentWrongPleaseTryAgain} ${e.toString()}',
      );
    }
  }

  bool shouldCurrentHybridBeRendered(
    EventAndLocationHybrid eventAndLocationHybrid,
  ) {
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
    switch (eventFilter!) {
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
    LocationNotificationModel locationNotificationModel,
  ) {
    switch (locationFilters!) {
      case LocationFilters.None:
        return true;

      case LocationFilters.Pending:
        {
          if (locationNotificationModel.key!.contains(
            location_package_constants.MixedConstants.SHARE_LOCATION,
          )) {
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
          location_package_constants.MixedConstants.SHARE_LOCATION,
        )
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
          location_package_constants.MixedConstants.SHARE_LOCATION,
        )
            ? compareAtSign(
                locationNotificationModel.receiver!,
                AtClientManager.getInstance().atClient.getCurrentAtSign()!,
              )
            : compareAtSign(
                locationNotificationModel.atsignCreator!,
                AtClientManager.getInstance().atClient.getCurrentAtSign()!,
              );
    }
  }
}
