class Id {
  final String? name;
  final String? value;
  const Id({required this.name, required this.value});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json['name'],
      value: json['value']??'N/A',
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;
  const Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Location {
  final String city;
  final String state;
  final String country;
  final String? pincode;

  const Location({
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      pincode: json['postcode'].toString(),
    );
  }
}

class User {
  final Id userid;
  final String email;
  final String phone;
  final String picture;
  final Name name;
  final Location location;

  const User({
    required this.userid,
    required this.email,
    required this.picture,
    required this.name,
    required this.location,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userid: Id.fromJson(json['id']),
      email: json['email'],
      phone: json['phone'].toString(),
      picture: json['picture']['medium'],
      name: Name.fromJson(json['name']),
      location: Location.fromJson(
        json['location'],
      ),
    );
  }
}
