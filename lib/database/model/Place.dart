class Place {
  final int no;
  final String id;
  final String place_id;
  final String name;
  final String address;

  Place({
    required this.no,
    required this.id,
    required this.place_id,
    required this.address,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': no,
      'id': id,
      "place_id": place_id,
      'name': name,
      "address": address,
    };
  }
}
