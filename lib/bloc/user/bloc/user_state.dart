part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario usuario;

  const UserState({this.existUser = false, this.usuario});
}

class UserInitial extends UserState {
  const UserInitial() : super(existUser: false);
}

class SetUser extends UserState {
  final Usuario user;

  const SetUser(this.user) : super(existUser: true, usuario: user);
}
