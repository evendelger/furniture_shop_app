import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/firebase/firebase_firestore/firestore_client.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Future<void> didChangeDependencies() async {
    await locator<FirestoreClient>().addToCart(userId: locator<FirebaseAuth>()., productId: productId)
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        NotificationAppBar(),
      ],
    );
  }
}
