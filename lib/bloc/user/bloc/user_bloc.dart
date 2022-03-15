import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<InitUser>((event, emit) {
      emit(SetUser(event.usuario));
    });

    on<EditName>((event, emit) {
      if (!state.existUser) return;
      emit(SetUser(state.usuario.copyWidth(nombre: event.newName)));
    });

    on<EditAge>((event, emit) {
      if (!state.existUser) return;
      emit(SetUser(state.usuario.copyWidth(edad: event.newAge)));
    });

    on<AddProfesion>((event, emit) {
      if (!state.existUser) return;
      final profesiones = [...state.usuario.profesiones, event.profesion];
      emit(SetUser(state.usuario.copyWidth(profesiones: profesiones)));
    });

    on<DeleteUser>((event, emit) {
      emit(UserInitial());
    });
  }
}
