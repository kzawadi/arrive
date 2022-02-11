import 'package:at_onboarding_flutter/at_onboarding_flutter.dart';
import 'package:atsign_location_app/application/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:atsign_location_app/shared/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingForm extends StatelessWidget {
  const OnBoardingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingBloc, OnBoardingState>(
      listener: (context, state) {
        state.mapOrNull(
          failure: (state) {
            //todo make a snack bar or something to show these errors
            print(
              state.onBoardingFailure.map(
                cancelledByUser: (_) => 'canceld',
                failedToGetgetApplicationSupportDirectory: (_) =>
                    'failedToGetgetApplicationSupportDirectory',
                serverError: (_) => 'server error',
              ),
            );
          },
          loading: (state) {
            Onboarding(
              context: context,
              onboard: (value, atsign) {
                context.read<OnBoardingBloc>().add(
                      OnBoardingEvent.atSignOnBoardingSucces(value, atsign),
                    );
              },
              onError: (error) {
                context.read<OnBoardingBloc>().add(
                      OnBoardingEvent.onBoardingError(error),
                    );
              },
              atClientPreference: state.atClientPreference,
              rootEnvironment: RootEnvironment.Production,
              appAPIKey: Constants.appApiKey,
              domain: Constants.rootDomain,
              appColor: const Color.fromARGB(255, 255, 122, 62),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          // initial: () => Center(
          //   child: Container(
          //     color: Colors.amber[50],
          //     child: Column(
          //       children: [
          //         ElevatedButton(
          //           onPressed: () {
          //             context.read<OnBoardingBloc>().add(
          //                   const OnBoardingEvent.onBoardingAtSign(),
          //                 );
          //           },
          //           child: const AutoSizeText('Onboard an @sign'),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          loadSuccess: (atSign) {
            return atSign.fold(
              () => const CircularProgressIndicator(),
              (a) => Center(
                child: Text(' @sign on boarded is ||| $a  |||'),
              ),
            );
          },
          onBoardingError: (e) {
            return AutoSizeText(e.toString());
          },
          orElse: () => const CircularProgressIndicator(),
        );
      },
    );
  }
}
