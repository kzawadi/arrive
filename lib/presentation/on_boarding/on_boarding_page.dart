import 'package:atsign_location_app/application/splash/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:atsign_location_app/injections.dart';
import 'package:atsign_location_app/presentation/on_boarding/on_boarding_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnBoardingBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('onboard data'),
        ),
        body: const OnBoardingForm(),
      ),
    );
  }
}
