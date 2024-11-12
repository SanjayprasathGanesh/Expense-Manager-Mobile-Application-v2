import 'package:expense_manager/database/database_connection.dart';
import 'package:expense_manager/view_model/users/user_credentials.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  DatabaseConnection databaseConnection = DatabaseConnection();

  bool _isLiked = false;
  late int _likesCount;
  String uName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setInitialValues();
  }

  setInitialValues() async {
    if (kIsWeb) {
      uName = UserCredentials.instance.getUserName();
    } else {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      uName = sharedPreferences.getString('uName')!;
    }
    bool liked = await databaseConnection.isLiked(uName);
    int count = await databaseConnection.getLikesCount();
    setState(() {
      _isLiked = liked;
      _likesCount = count;
    });
  }

  likedByUser() async {
    await databaseConnection.like(uName);
  }

  unLike() async {
    await databaseConnection.unLike(uName);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: _isLiked ? Colors.red : Colors.black,
            width: 2.0,
          ),
        ),
        child: MaterialButton(
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
              if (_isLiked) {
                _likesCount++;
                likedByUser();
              } else {
                _likesCount--;
                unLike();
              }
            });
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                bottom: _isLiked ? 60.0 : 0.0,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _isLiked ? 'Liked!' : 'Like our App',
                    style: TextStyle(
                      color: _isLiked ? Colors.red : Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10), // Space between text and count
                  Text(
                    _isLiked ? '$_likesCount' : "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
