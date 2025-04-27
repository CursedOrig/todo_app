import 'package:flutter/material.dart';
import '../res/app_res.dart';
import 'package:check_list_app/pages/home_page.dart';

class CreateItemDialog extends StatefulWidget {
  const CreateItemDialog({super.key});

  @override
  State<CreateItemDialog> createState() => _CreateItemDialogState();
}

class _CreateItemDialogState extends State<CreateItemDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView( // <-- Оборачиваем всё в скролл
          child: Container(
            padding: const EdgeInsets.all(32),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: AppDeco.mainDeco,
            child: Column(
              mainAxisSize: MainAxisSize.min, // <-- минимальный размер
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: 'Enter your todo',
                    hintStyle: AppTypo.headerM,
                    border: InputBorder.none,
                  ),
                  style: AppTypo.headerM,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24), // вместо Spacer чтобы избежать перерасчёта высоты
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel', style: AppTypo.headerS),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () async {
                        final text = _textController.text.trim();
                        if (text.isNotEmpty) {
                          globalProvider.saveTodoItem(text);
                        }
                        Navigator.of(context).pop();
                      },
                      child: Text('Add', style: AppTypo.headerS),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
