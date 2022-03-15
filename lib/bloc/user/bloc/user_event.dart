part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class InitUser extends UserEvent {
  final Usuario usuario;

  InitUser(this.usuario);
}

class EditName extends UserEvent {
  final String newName;

  EditName(this.newName);
}

class AddProfesion extends UserEvent {
  final String profesion;

  AddProfesion(this.profesion);
}

class EditAge extends UserEvent {
  final int newAge;

  EditAge(this.newAge);
}

class DeleteUser extends UserEvent {}
