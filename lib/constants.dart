import 'package:flutter/material.dart';

const kPrimaryColor = Colors.lightBlue;
const kSecondaryColor = Colors.white;
const kPressedColor = Colors.blueAccent;
const kWarningColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const kBackgroundColor = Color(0xFFEEEEEE);

const kDefaultPadding = 10.0;

const hostname = "http://localhost:8000";
//API For Users
const userSignUpEndpoint = "/api/v1/users/register/";
const userLogInEndpoint = "/api/v1/users/login/";
const userGetInforEndpoint = "/api/v1/users/show";

//API For Friend
const friendGetListEndpoint = "/api/v1/friends/list";

//API For Post
const postGetListEndpoint = "/api/v1/posts/list";

const usernameFontSize = 20.0;
const postContentFontSize = 16.0;
const lightFontWeight = FontWeight.w200;
const normalFontWeight = FontWeight.normal;
const boldFontWeight = FontWeight.bold;