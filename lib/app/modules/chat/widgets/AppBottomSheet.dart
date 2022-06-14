import 'package:flutter/material.dart';
import 'package:sese/app/modules/chat/widgets/IconCreation.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(18),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  IconCreation(
                      title: "Document",
                      color: Color.fromARGB(255, 78, 15, 71),
                      icon: Icons.description),
                  IconCreation(
                    title: "Camera",
                    color: Colors.red,
                    icon: Icons.photo_camera,
                  ),
                  IconCreation(
                    title: "Gallery",
                    color: Colors.purple,
                    icon: Icons.image,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  IconCreation(
                    title: "Audio",
                    color: Colors.orange,
                    icon: Icons.headphones,
                  ),
                  IconCreation(
                    title: "Location",
                    color: Colors.pink,
                    icon: Icons.location_on,
                  ),
                  IconCreation(
                    title: "Contact",
                    color: Colors.blue,
                    icon: Icons.person,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
