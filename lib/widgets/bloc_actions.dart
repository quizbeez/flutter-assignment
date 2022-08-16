import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_home_assignment/bloc/timer_bloc.dart';

class TimerBlocActions extends StatelessWidget {
  const TimerBlocActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        if (state is TimerInitial) {
          context.read<TimerBloc>().add(TimerStarted(duration: state.duration));
        }

        if (state is TimerRunComplete) {
          context.read<TimerBloc>().add(const TimerReset());
        }

        return const SizedBox.shrink();
      },
    );
  }
}
