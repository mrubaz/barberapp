import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserHairStyleList extends StatelessWidget {
  const UserHairStyleList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserStyleController());
    return Scaffold(body: SafeArea(
      child: GetBuilder<UserStyleController>(
        builder: (_) {
          return Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(left: 8.0, top: 12.0),
                  hintText: "Search here",
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  height: 3,
                  width: Get.width,
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0))),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.userList.length,
                  physics: const ScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        height: 80,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffd5d8df),
                          border: Border.all(),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: double.infinity,
                              width: 80,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.userList[index].username),
                                Text(controller.userList[index].location),
                                Text(controller.userList[index].rating),
                                const Expanded(child: SizedBox()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}

class UserData {
  final String username;
  final String location;
  final String rating;

  UserData(
      {required this.username, required this.location, required this.rating});
}

class UserStyleController extends GetxController {
  final List<UserData> userList = [
    UserData(
      username: 'Adam',
      location: 'Location: Iqbal Town Lahore',
      rating: 'Rating: 4/5',
    ),
    UserData(
      username: 'Noah',
      location: 'Location: Model Town Lahore',
      rating: 'Rating: 3.8/5',
    ),
    UserData(
      username: 'Ethan',
      location: 'Location: Gulberg Lahore',
      rating: 'Rating: 4.2/5',
    ),
    UserData(
      username: 'Liam',
      location: 'Location: Johar Town Lahore',
      rating: 'Rating: 4.0/5',
    ),
    UserData(
      username: 'Mason',
      location: 'Location: DHA Lahore',
      rating: 'Rating: 4.7/5',
    ),
    UserData(
      username: 'Lucas',
      location: 'Location: Faisal Town Lahore',
      rating: 'Rating: 3.5/5',
    ),
    UserData(
      username: 'Jackson',
      location: 'Location: Wapda Town Lahore',
      rating: 'Rating: 4.8/5',
    ),
    UserData(
      username: 'Aiden',
      location: 'Location: Samanabad Lahore',
      rating: 'Rating: 3.9/5',
    ),
    UserData(
      username: 'Carter',
      location: 'Location: Township Lahore',
      rating: 'Rating: 4.1/5',
    ),
    UserData(
      username: 'Oliver',
      location: 'Location: Green Town Lahore',
      rating: 'Rating: 3.6/5',
    ),
    UserData(
      username: 'Daniel',
      location: 'Location: Raiwind Lahore',
      rating: 'Rating: 4.3/5',
    ),
    UserData(
      username: 'Henry',
      location: 'Location: Shadman Lahore',
      rating: 'Rating: 4.6/5',
    ),
    UserData(
      username: 'Sebastian',
      location: 'Location: Chungi Amar Sadhu Lahore',
      rating: 'Rating: 3.7/5',
    ),
    UserData(
      username: 'Matthew',
      location: 'Location: Sabzazar Lahore',
      rating: 'Rating: 4.4/5',
    ),
    UserData(
      username: 'Elijah',
      location: 'Location: Garden Town Lahore',
      rating: 'Rating: 3.8/5',
    ),
  ];
}
