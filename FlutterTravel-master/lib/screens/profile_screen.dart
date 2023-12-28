import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/edit_profile_screen.dart';
import 'package:flutter_travel_concept/widgets/bottom_navigation_bar.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  // user data
  String displayName = 'Nhu Quynh';
  String bio = 'xin chao rat vui duoc gap ban';
  String avatarUrl = 'assets/avatar.png';

  int postNum = 3;
  int followers = 10;
  int following = 30;


  bool isFollowing = true;
  bool isLoading = false;
  bool isYou = true;
  @override
  Widget build(BuildContext context) {
    return isLoading  ? const Center(child: CircularProgressIndicator(),)
    : Scaffold(
      appBar: AppBar(
        title: Text(displayName),
        centerTitle: true,
      ),
      body:
      Column(
        children: [
          Row(
            mainAxisAlignment : MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(backgroundImage: AssetImage(avatarUrl),radius: 50,)
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text(bio),
            padding: EdgeInsets.all(10),
          ),
          isYou?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
              child: Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, foregroundColor: Colors.blue
                )
              )
            ]
          )
          :Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                child: Text(isFollowing ? 'Following' : 'Follow'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFollowing ? Colors.green : Colors.blue,
                ),
              ),
              SizedBox(width: 30),
              ElevatedButton(
                  onPressed: () {
                    // Do something when the button is pressed.
                  },
                  child: Text('Message'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, foregroundColor: Colors.blue
                  )
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStatColumn(postNum, "posts"),
                          buildStatColumn(followers, "followers"),
                          buildStatColumn(following, "following"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
          child: BottomNavigationBarWidget(),
        )
    );
}

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
