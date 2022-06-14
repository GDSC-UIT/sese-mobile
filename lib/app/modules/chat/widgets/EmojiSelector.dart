import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class EmojiSelector extends StatelessWidget {
  const EmojiSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: EmojiPicker(
        config: const Config(
          initCategory: Category.SMILEYS,
          columns: 7,
        ),
        onEmojiSelected: ((category, emoji) {
          print(emoji);
        }),
      ),
    );
  }
}
