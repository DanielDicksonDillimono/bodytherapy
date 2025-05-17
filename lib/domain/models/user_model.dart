//users are either patients or "careTakers".

class User {
  const User({required String name, required String id})
      : _name = name,
        _id = id,
        _organisationId = "";

  const User.careTaker(
      {required String name,
      required String id,
      required String organisationId})
      : _name = name,
        _id = id,
        _organisationId = organisationId;

  final String _name;
  final String _id;
  final String _organisationId;

  String get name => _name;
  String get id => _id;
  String get organisationId => _organisationId;
}
