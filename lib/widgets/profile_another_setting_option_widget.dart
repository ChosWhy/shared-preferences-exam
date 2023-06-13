import 'package:flutter/material.dart';

class ProfileAnotherSettingOptionWidget extends StatelessWidget {
  const ProfileAnotherSettingOptionWidget({
    super.key, required this.title, required this.icon,
  });
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(icon,size: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(title,style: Theme.of(context).textTheme.titleMedium,),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.blue,))
          ],
        )
    );
  }
}