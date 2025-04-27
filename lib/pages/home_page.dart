import 'package:check_list_app/data/todo_items_provider.dart';
import 'package:check_list_app/res/app_res.dart';
import 'package:check_list_app/widgets/rich_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/create_item_dialog.dart';

final globalProvider = TodoItemsProvider();

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => globalProvider..loadTodoItems(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (cont) {
                  return CreateItemDialog();
                });
          },
        ),
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const RichSubtitle(),
          backgroundColor: AppColors.background,
        ),
        body: Consumer<TodoItemsProvider>(
          builder:
              (BuildContext context, TodoItemsProvider value, Widget? child) {
            return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: value.todoItems.length,
                itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      decoration: AppDeco.mainDeco,
                      margin: const EdgeInsets.only(bottom: 8),
                      height: 60,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                globalProvider.invertDoneState(value.todoItems[index].key);
                              },
                              child: Text(
                                  '${value.todoItems[index].label}',
                                  style: AppTypo.headerM.copyWith(
                                    decoration: (value.todoItems[index].isDone)
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: (value.todoItems[index].isDone)
                                        ? AppColors.secondary
                                        : AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          InkWell(
                            onTap: () async {
                              final result = await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('You sure?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          const SizedBox(width: 20),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop('papajopa');
                                            },
                                            child: const Text('Delete'),
                                          )
                                        ],
                                      ));

                              if (result != null) {
                                globalProvider.deleteTodoItem(value.todoItems[index].key);
                              }
                            },
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primary1,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: AppColors.layer1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
          },
        ),
      ),
    );
  }
}
