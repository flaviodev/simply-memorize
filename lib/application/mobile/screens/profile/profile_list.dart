import 'package:memorize/application/mobile/components/items_list.dart';
import 'package:memorize/application/mobile/components/list_item.dart';
import 'package:memorize/application/mobile/screens/profile/profile_form.dart';
import 'package:memorize/domain/profile/profile_service.dart';
import 'package:memorize/domain/profile/entities/profile.dart';
import 'package:memorize/main.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileListState();
  }
}

class ProfileListState extends ItemsListState<Profile, ProfileService> {
  ProfileListState()
      : super(
            service: MemorizeApp.injector.get<ProfileService>(),
            title: 'Profiles',
            itemForm: ProfileForm());

  @override
  StatelessWidget toItem(Profile profile) {
    return ListItem(title: profile.name, icon: Icons.people);
  }
}
