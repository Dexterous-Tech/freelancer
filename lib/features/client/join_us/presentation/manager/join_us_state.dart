part of 'join_us_cubit.dart';

@immutable
sealed class JoinUsState {}

final class JoinUsInitial extends JoinUsState {}

final class JoinMyImageFailure extends JoinUsState {
  final String error;

  JoinMyImageFailure(this.error);
}

final class JoinMyImageSelected extends JoinUsState {
  final File image;

  JoinMyImageSelected(this.image);
}
