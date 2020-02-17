import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final IconData _icone;
  final TextInputType _keyboard;

  Editor(this._controlador, this._rotulo, this._dica, this._icone, this._keyboard);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: _icone != null ? Icon(_icone) : null,
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType:  _keyboard != null ? _keyboard : TextInputType.number,
      ),
    );
  }
}