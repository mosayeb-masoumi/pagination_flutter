class CharacterSummary {
  final int id;
  final String name;
  final String pictureUrl;

  CharacterSummary(this.id, this.name, this.pictureUrl);

// CharacterSummary({
  //   required this.id,
  //   required this.name,
  //   required this.pictureUrl,
  // });
  //
  // factory CharacterSummary.fromJson(Map<String, dynamic> json) =>
  //     CharacterSummary(
  //       id: json['char_id'],
  //       name: json['name'],
  //       pictureUrl: json['img'],
  //     );

}
