class Profile {
  final String id;
  final String name;

  Profile(this.id, this.name);

  @override
  String toString() {
    return 'Profile {id: $id, name: $name}';
  }
}