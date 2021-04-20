import 'dart:typed_data';
import 'package:at_contact/at_contact.dart';
import 'package:at_contacts_flutter/utils/init_contacts_service.dart';
import 'package:at_contacts_flutter/widgets/contacts_initials.dart';
import 'package:atsign_location_app/common_components/bottom_sheet/bottom_sheet.dart';
import 'package:atsign_location_app/common_components/change_atsign_bottom_sheet.dart';
import 'package:atsign_location_app/plugins/at_events_flutter/common_components/custom_toast.dart';
import 'package:atsign_location_app/plugins/at_location_flutter/service/my_location.dart';
import 'package:atsign_location_app/routes/route_names.dart';
import 'package:atsign_location_app/routes/routes.dart';
import 'package:atsign_location_app/screens/contacts/contacts_bottomsheet.dart';
import 'package:atsign_location_app/services/backend_service.dart';
import 'package:atsign_location_app/services/location_notification_listener.dart';
import 'package:atsign_location_app/utils/constants/colors.dart';
import 'package:atsign_location_app/utils/constants/text_styles.dart';
import 'package:atsign_location_app/view_models/hybrid_provider.dart';
import 'package:flutter/material.dart';
import 'package:at_common_flutter/services/size_config.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool state = false;
  Uint8List image;
  AtContact contact;
  AtContactsImpl atContact;
  String name;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    getEventCreator();
    state = false;
    getLocationSharing();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  getLocationSharing() async {
    bool newState = await LocationNotificationListener().getShareLocation();
    setState(() {
      state = newState;
    });
  }

  getEventCreator() async {
    AtContact contact = await getAtSignDetails(
        BackendService.getInstance().atClientInstance.currentAtSign);
    name = null;
    if (contact != null) {
      if (contact.tags != null && contact.tags['image'] != null) {
        List<int> intList = contact.tags['image'].cast<int>();
        setState(() {
          image = Uint8List.fromList(intList);
        });
      }
      if (contact.tags != null && contact.tags['name'] != null) {
        String newName = contact.tags['name'].toString();
        setState(() {
          name = newName;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 0.toHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 0.toWidth, vertical: 50.toHeight),
              child: Row(
                children: [
                  (image != null)
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.toFont)),
                          child: Image.memory(
                            image,
                            width: 50.toFont,
                            height: 50.toFont,
                            fit: BoxFit.fill,
                          ),
                        )
                      : ContactInitial(
                          initials: BackendService.getInstance()
                              .atClientServiceInstance
                              .atClient
                              .currentAtSign
                              .substring(1, 3)),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        name != null
                            ? Text(
                                name ?? '',
                                style: CustomTextStyles().darkGrey16,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            : SizedBox(),
                        Text(
                          BackendService.getInstance()
                                  .atClientInstance
                                  .currentAtSign ??
                              '@sign',
                          style: CustomTextStyles().darkGrey14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            iconText('Events', Icons.arrow_upward,
                () => SetupRoutes.push(context, Routes.EVENT_LOG)),
            SizedBox(
              height: 25.toHeight,
            ),
            iconText(
              'Contacts',
              Icons.contacts_rounded,
              () async {
                BackendService backendService = BackendService.getInstance();
                String currentAtSign = await backendService.getAtSign();
                return SetupRoutes.push(context, Routes.CONTACT_SCREEN,
                    arguments: {
                      'currentAtSign': currentAtSign,
                      'asSelectionScreen': false,
                      'onSendIconPressed': (String atsign) {
                        bottomSheet(context, ContactsBottomSheet(atsign), 150);
                      },
                    });
              },
            ),
            SizedBox(
              height: 25.toHeight,
            ),
            iconText(
              'Blocked Contacts',
              Icons.contacts_rounded,
              () async {
                return SetupRoutes.push(
                  context,
                  Routes.BLOCKED_CONTACT_SCREEN,
                );
              },
            ),
            SizedBox(
              height: 25.toHeight,
            ),
            iconText(
              'Groups',
              Icons.group,
              () async {
                BackendService backendService = BackendService.getInstance();
                String currentAtSign = await backendService.getAtSign();
                return SetupRoutes.push(context, Routes.GROUP_LIST, arguments: {
                  'currentAtSign': currentAtSign,
                });
              },
            ),
            SizedBox(
              height: 25.toHeight,
            ),
            iconText('FAQ', Icons.question_answer,
                () => SetupRoutes.push(context, Routes.FAQS)),
            SizedBox(
              height: 25.toHeight,
            ),
            iconText(
                'Terms and Conditions',
                Icons.text_format_outlined,
                () =>
                    SetupRoutes.push(context, Routes.TERMS_CONDITIONS_SCREEN)),
            SizedBox(
              height: 25.toHeight,
            ),
            SizedBox(
              height: 40.toHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Location Sharing',
                  style: CustomTextStyles().darkGrey16,
                ),
                Consumer<HybridProvider>(
                  builder: (context, provider, child) {
                    return Switch(
                      value: provider.isSharing,
                      onChanged: (value) async {
                        if (value) {
                          LatLng latlng = await getMyLocation();
                          if (latlng == null) {
                            CustomToast().show(
                                'Location permission not granted', context);
                            return;
                          }
                        }
                        LocationNotificationListener()
                            .updateShareLocation(value);
                        setState(() {
                          state = value;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 14.toHeight,
            ),
            Flexible(
                child: Text(
              'When you turn this on, everyone you have given access to can see  your location.',
              style: CustomTextStyles().darkGrey12,
            )),
            Expanded(child: Container(height: 0)),
            iconText('Switch @sign', Icons.logout, () async {
              String currentAtsign =
                  BackendService.getInstance().atClientInstance.currentAtSign;
              var atSignList = await BackendService.getInstance()
                  .atClientServiceMap[currentAtsign]
                  .getAtsignList();

              await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => AtSignBottomSheet(
                  atSignList: atSignList,
                ),
              );
            }),
            Expanded(child: Container(height: 0)),
            Text(
              'App Version ${_packageInfo.version} (${_packageInfo.buildNumber})',
              style: CustomTextStyles().darkGrey13,
            ),
          ],
        ),
      ),
    );
  }

  Widget iconText(String text, IconData icon, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: AllColors().DARK_GREY,
            size: 16.toFont,
          ),
          SizedBox(
            width: 15.toWidth,
          ),
          Flexible(
            child: Text(
              text,
              style: CustomTextStyles().darkGrey16,
            ),
          ),
        ],
      ),
    );
  }
}
