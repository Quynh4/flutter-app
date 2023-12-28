import "package:flutter/material.dart";
import "package:flutter_travel_concept/screens/profile_screen.dart";

import "../widgets/bottom_navigation_bar.dart";

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String displayName = 'quynh';
  String bio = 'xin chao rat vui duoc gap ban';
  String avatarUrl = 'assets/avatar.png';


  TextEditingController displayNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override

  Column buildDisplayNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "Display Name",
              style: TextStyle(color: Colors.grey),
            )),
        TextField(
          controller: displayNameController,
          decoration: InputDecoration(
            hintText: displayName,
          ),
        )
      ],
    );
  }

  Column buildBioField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text(
              "Bio",
              style: TextStyle(color: Colors.grey),
            )),
        TextField(
          controller: bioController,
          decoration: InputDecoration(
            hintText: bio,
          ),
        )
      ],
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Edit Profile"),
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen())),
            icon: Icon(Icons.done, size: 30.0, color: Colors.green,),
          ),
        ],
      ),
      body: Column(
        children:[
          Row(
            mainAxisAlignment : MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(backgroundImage: AssetImage(avatarUrl),radius: 50,),
              SizedBox(width: 30),
              ElevatedButton(
                onPressed: () => print('Update profile data'),
                child: Text("Update Profile"),
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, foregroundColor: Colors.blue
                  )
                ),
            ]
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                buildDisplayNameField(),
                buildBioField(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBarWidget(),
      ),
    );
  }
}