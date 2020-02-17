import 'package:memorize/main.dart';
import 'package:memorize/application/mobile/components/editor.dart';
import 'package:memorize/domain/profile/profile_service.dart';
import 'package:memorize/domain/profile/entities/profile.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProfileForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileFormState();
  }
}

class ProfileFormState extends State<ProfileForm> {
  final ProfileService _service = MemorizeApp.injector.get<ProfileService>();

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                _nameController, 'Name', '', Icons.people, TextInputType.text),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () => _createProfile(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createProfile(BuildContext context) {
    final String name = _nameController.text;
    if (name != null) {
      _service
          .create(Profile(Uuid().v1(), name))
          .then((id) => Navigator.pop(context));
    }
  }
}
