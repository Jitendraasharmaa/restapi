import 'package:flutter/material.dart';
import 'package:restapi/models/users.dart';
import 'package:restapi/screens/user_details.dart';
import 'package:restapi/services/user_api_service.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService().getUsers();
  }

  void pageNagivate(
    context,
    String title,
    String firstName,
    String lastName,
    String imgUrl,
    String email,
    String phone,
    String city,
    String state,
    String country,
    String pincode,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetials(
          title: title,
          firstName: firstName,
          lastName: lastName,
          imgUrl: imgUrl,
          email: email,
          city: city,
          state: state,
          country: country,
          pincode: pincode,
          phone: phone,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 16,
          centerTitle: true,
          title: const Text("Users"),
        ),
        body: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    User user = snapshot.data?[index];
                    final title = user.name.title;
                    final firstName = user.name.first;
                    final lastNAme = user.name.last;
                    final imgUrl = user.picture;
                    final email = user.email;
                    final phone = user.phone;
                    final city = user.location.city;
                    final state = user.location.state;
                    final country = user.location.country;
                    final pincode = user.location.pincode;
                    final userId = user.userid.value;
                    return Card(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(imgUrl),
                        ),
                        title: Text(
                          '$firstName $lastNAme',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userId ?? 'N/A',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              email,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          pageNagivate(
                            context,
                            title,
                            firstName,
                            lastNAme,
                            imgUrl,
                            email,
                            phone,
                            city,
                            state,
                            country,
                            pincode.toString(),
                          );
                        },
                        trailing: const Icon(Icons.chevron_right_outlined),
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text("ERROR: ${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
