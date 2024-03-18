import 'package:flutter/material.dart';

class UserDetials extends StatelessWidget {
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? imgUrl;
  final String? email;
  final String? phone;
  final String? city;
  final String? state;
  final String? country;
  final String? pincode;
  const UserDetials({
    super.key,
    this.title,
    this.firstName,
    this.lastName,
    this.imgUrl,
    this.email,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.phone
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          centerTitle: true,
          title: const Text('Profile'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    imgUrl ?? '',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 16,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                surfaceTintColor: Colors.amber,
                color: Colors.red,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  minVerticalPadding: 0.0,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(text: 'Name: '),
                        TextSpan(
                          text: '$title $firstName $lastName',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        email ?? '',
                        style: const TextStyle(color: Colors.black,fontSize: 14),
                      ),
                      Text(
                        phone ?? '',
                        style: const TextStyle(color: Colors.black,fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                elevation: 16,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                surfaceTintColor: Colors.amber,
                color: Colors.green[100],
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  minVerticalPadding: 0.0,
                  title: const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "City: ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: city ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "State: ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: state ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Country: ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: country ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Pincode: ",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: pincode ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
