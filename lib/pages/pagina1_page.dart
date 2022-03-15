import 'package:estados/bloc/user/bloc/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false)
                    .add(DeleteUser());
              },
              icon: Icon(Icons.delete_outline))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario(
                  usuario: state.usuario,
                )
              : Center(
                  child: Text('Sin usuario asignado'),
                );
        },
      ),
      // InformacionUsuario(),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({Key key, this.usuario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ...usuario.profesiones
              .map((prof) => ListTile(title: Text(prof)))
              .toList()
        ],
      ),
    );
  }
}
