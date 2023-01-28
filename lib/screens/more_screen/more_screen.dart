import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
              ),
              Column(children: [
                MoreScreenCard(
                  leading: Icons.card_giftcard,
                  title: 'Testing',
                  onTap: () {},
                  trailing: Icons.more,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: MoreScreenCard(
                    leading: Icons.card_giftcard,
                    title: 'Testing',
                    onTap: () {},
                    trailing: Icons.more,
                  ),
                ),
                MoreScreenCard(
                  leading: Icons.card_giftcard,
                  title: 'Testing',
                  onTap: () {},
                  trailing: Icons.more,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class MoreScreenCard extends StatelessWidget {
  final IconData leading;
  final String title;
  final IconData trailing;
  final VoidCallback onTap;
  const MoreScreenCard(
      {super.key,
      required this.leading,
      required this.title,
      required this.trailing,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(leading),
        title: Text(title),
        trailing: Icon(trailing),
        onTap: onTap,
      ),
    );
  }
}
