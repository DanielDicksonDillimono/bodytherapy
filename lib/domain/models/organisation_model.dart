class OrganisationModel {
  const OrganisationModel({
    required String name,
    required String description,
    required String id,
  })  : _name = name,
        _description = description,
        _id = id;
  final String _name;
  final String _id;
  final String _description;

  String get name => _name;
  String get id => _id;
  String get description => _description;
}
