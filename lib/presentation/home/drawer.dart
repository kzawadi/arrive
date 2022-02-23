// ignore_for_file: lines_longer_than_80_chars

import 'dart:typed_data';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_common_flutter/services/size_config.dart';
import 'package:at_contacts_flutter/widgets/contacts_initials.dart';
import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:atsign_location_app/application/side_drawer/cubit/drawer_cubit.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/routes/router.gr.dart';
import 'package:atsign_location_app/shared/common_components/dialog_box/manage_location_sharing.dart';
import 'package:atsign_location_app/shared/common_components/iconly_icon.dart';
import 'package:atsign_location_app/shared/common_components/icons_curved.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:atsign_location_app/shared/text_strings.dart';
import 'package:atsign_location_app/shared/text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PackageInfo _packageInfo = PackageInfo(
      appName: '@rrive',
      packageName: 'atsign_location_app',
      version: '1.0.3',
      buildNumber: '+30',
    );

    final navKey = AutoRouter.of(context).navigatorKey;

    Uint8List? image;

    return BlocBuilder<DrawerCubit, DrawerState>(
      bloc: getIt<DrawerCubit>()..getAtsign(),
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
          atSignLoaded: (atsign) {
            return Scaffold(
              appBar: AppBar(
                leadingWidth: 30,
                title: Text(
                  TextStrings.sideBarTitle,
                  style: CustomTextStyles().darkGrey16,
                ),
                centerTitle: true,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () => AutoRouter.of(context).pop(),
                  child: const IconlyIcon(
                    path: IconlyCurved.ArrowLeft2,
                    size: 10,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(25),
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 0.toHeight,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.toWidth,
                          vertical: 50.toHeight,
                        ),
                        child: Row(
                          children: [
                            if (image != null)
                              ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.toFont),
                                ),
                                child: Image.memory(
                                  image,
                                  width: 50.toFont,
                                  height: 50.toFont,
                                  fit: BoxFit.fill,
                                ),
                              )
                            else
                              ContactInitial(
                                initials: atsign.fold(
                                  () => TextStrings.someErrorOccured,
                                  (a) => a,
                                ),
                              ),
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (!atsign.isSome())
                                      Text(
                                        atsign.fold(
                                          () => TextStrings.someErrorOccured,
                                          (a) => a,
                                        ),
                                        style: CustomTextStyles().darkGrey16,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    else
                                      const SizedBox(),
                                    Text(
                                      atsign.fold(
                                        () => TextStrings.someErrorOccured,
                                        (a) => a,
                                      ),
                                      style: CustomTextStyles().darkGrey14,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      iconText(
                        TextStrings.events,
                        IconlyIcon(
                          path: IconlyCurved.TimeCircle,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        () =>
                            AutoRouter.of(context).push(const EventLogRoute()),
                      ),
                      SizedBox(
                        height: 25.toHeight,
                      ),
                      iconText(
                        TextStrings.contacts,
                        IconlyIcon(
                          path: IconlyCurved.AddUser,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        () =>
                            AutoRouter.of(context).push(ContactsScreenRoute()),
                      ),
                      SizedBox(
                        height: 25.toHeight,
                      ),
                      iconText(
                        TextStrings.blockedContacts,
                        IconlyIcon(
                          path: IconlyCurved.ShieldFail,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        () => AutoRouter.of(context)
                            .push(const BlockedScreenRoute()),
                      ),
                      SizedBox(
                        height: 25.toHeight,
                      ),
                      iconText(
                        TextStrings.groups,
                        IconlyIcon(
                          path: IconlyCurved.User3,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        () =>
                            AutoRouter.of(context).push(const GroupListRoute()),
                      ),
                      SizedBox(
                        height: 25.toHeight,
                      ),
                      iconText(
                        TextStrings.backupYourKeys,
                        IconlyIcon(
                          path: IconlyCurved.Lock,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        () async {
                          BackupKeyWidget(
                            atsign: AtClientManager.getInstance()
                                .atClient
                                .getCurrentAtSign()!,
                          ).showBackupDialog(context);
                        },
                      ),
                      SizedBox(
                        height: 25.toHeight,
                      ),
                      iconText(
                        TextStrings.termsAndCondition,
                        IconlyIcon(
                          path: IconlyCurved.Paper,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        () => AutoRouter.of(context).push(
                          WebsiteScreenRoute(
                            key: key,
                            title: TextStrings.termsAndCondition,
                            url: Constants.websiteUrl,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.toHeight,
                      ),
                      iconText(
                        TextStrings.manageLocationSharing,
                        IconlyIcon(
                          path: IconlyCurved.Location,
                          color: Theme.of(context).primaryColor,
                          size: 30,
                        ),
                        () {
                          manageLocationSharing(navKey);
                        },
                      ),
                      SizedBox(
                        height: 25.toHeight,
                      ),
                      SizedBox(
                        height: 14.toHeight,
                      ),
                      Expanded(child: Container(height: 0)),
                      Text(
                        '${TextStrings.appVersion} ${_packageInfo.version} (${_packageInfo.buildNumber})',
                        style: CustomTextStyles().darkGrey13,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget iconText(String text, Widget icon, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(child: icon),
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
