// ignore_for_file: cascade_invocations

import 'package:at_onboarding_flutter/services/size_config.dart';
import 'package:atsign_location_app/application/location/bloc/location_bloc.dart';
import 'package:atsign_location_app/application/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:atsign_location_app/application/side_drawer/cubit/drawer_cubit.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/events/event_log_page.dart';
import 'package:atsign_location_app/presentation/on_boarding/on_boarding_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_actions/quick_actions.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  String shortcut = 'no action set';

  @override
  void initState() {
    super.initState();

    try {
      // Reading app shortcuts input
      const QuickActions quickActions = QuickActions();
      quickActions.initialize((String shortcutType) {
        setState(() {
          shortcut = shortcutType;
        });
      });
      // const QuickActions quickActions = QuickActions();
      // quickActions.initialize(
      //   (type) {
      //     switch (type) {
      //       case 'vehicles':
      //         setState(() => _currentIndex = 1);
      //         break;
      //       case 'upcoming':
      //         setState(() => _currentIndex = 2);
      //         break;
      //       case 'latest':
      //         setState(() => _currentIndex = 3);
      //         break;
      //       default:
      //         setState(() => _currentIndex = 0);
      //     }
      //   },
      // );
      quickActions.setShortcutItems(<ShortcutItem>[
        // NOTE: This first action icon will only work on iOS.
        // In a real world project keep the same file name for both platforms.
        const ShortcutItem(
          type: 'Events',
          localizedTitle: 'Events',
          icon: 'ticket_star',
        ),
        // NOTE: This second action icon will only work on Android.
        // In a real world project keep the same file name for both platforms.
        const ShortcutItem(
          type: 'Create event',
          localizedTitle: 'Create event',
          icon: 'edit_square',
        ),
        const ShortcutItem(
          type: 'Share location',
          localizedTitle: 'Share location',
          icon: 'send_icon',
        ),
        // const ShortcutItem(
        //   type: 'Create event',
        //   localizedTitle: 'Action two',
        //   icon: 'ic_launcher',
        // ),
      ]).then((void _) {
        setState(() {
          if (shortcut == 'no action set') {
            shortcut = 'actions ready';
          }
        });
      });
      // }
      // Future.delayed(Duration.zero, () async {
      //   // Setting app shortcuts
      //   await quickActions.setShortcutItems(<ShortcutItem>[
      //     ShortcutItem(
      //       type: 'vehicles',
      //       localizedTitle: context.translate('spacex.vehicle.icon'),
      //       icon: 'action_vehicle',
      //     ),
      //     ShortcutItem(
      //       type: 'upcoming',
      //       localizedTitle: context.translate('spacex.upcoming.icon'),
      //       icon: 'action_upcoming',
      //     ),
      //     ShortcutItem(
      //       type: 'latest',
      //       localizedTitle: context.translate('spacex.latest.icon'),
      //       icon: 'action_latest',
      //     ),
      //   ]);
      // });
    } catch (_) {
      debugPrint('could set quick actions');
    }
  }

  @override
  Widget build(BuildContext context) {
    final navKey = AutoRouter.of(context).navigatorKey;
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnBoardingBloc>(
          create: (context) => getIt<OnBoardingBloc>()
            ..add(
              const OnBoardingEvent.onBoardingAtSign(),
            ),
        ),
        BlocProvider<LocationBloc>(
          // lazy: false,
          create: (context) => getIt<LocationBloc>()
            ..add(
              LocationEvent.started(navKey),
            ),
        ),
        BlocProvider<DrawerCubit>(
          // lazy: false,
          create: (context) => getIt<DrawerCubit>(),
        ),
      ],
      child: const EventLog(),
    );
  }
}
