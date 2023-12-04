import 'package:flutter/material.dart';
import 'package:furniture_shop_app/data/firebase/firebase_auth/firebase_auth_client.dart';
import 'package:furniture_shop_app/data/firebase/firebase_firestore/firestore_client.dart';
import 'package:furniture_shop_app/locator.dart';
import 'package:furniture_shop_app/presentation/features/notification/notification.dart';
//import 'package:talker/talker.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  void testFunc() async {
    await locator<FirestoreClient>().addToCart(
      userId: locator<AuthClient>().getUserId,
      productId: "520f26d2-c5d7-46fa-b80d-639754e88fc2",
    );
    //Talker().log(result);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const NotificationAppBar(),
        SliverToBoxAdapter(
          child: ElevatedButton(
            onPressed: testFunc,
            child: const Text('Test'),
          ),
        ),
      ],
    );
  }
}
