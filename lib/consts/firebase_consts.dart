import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth=FirebaseAuth.instance;
FirebaseFirestore firestore=FirebaseFirestore.instance;
User? currentuser=auth.currentUser;
const userCollection='users';
const productsCollection="products";
const cartCollection="cart";
const chatCollection="chat";
const messagesCollection="messages";

