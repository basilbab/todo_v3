import 'package:flutter/material.dart';
import 'package:todo_v3/domain/todo/todo_model.dart';

class ScreenTodoHome extends StatefulWidget {
  const ScreenTodoHome({super.key});

  @override
  State<ScreenTodoHome> createState() => _ScreenTodoHomeState();
}

class _ScreenTodoHomeState extends State<ScreenTodoHome> {
  List<TodoModel> todoModel = [
    TodoModel(todoId: '1', todoName: 'College', todoStatus: '1'),
    TodoModel(todoId: '2', todoName: 'Bus', todoStatus: '0'),
    TodoModel(todoId: '3', todoName: 'Resturant', todoStatus: '0'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: Row(
                children: [
                  Expanded(child: TextFormField()),
                  ElevatedButton(onPressed: () {}, child: const Text('Add'))
                ],
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * .8,
                child: ListView.builder(
                  itemBuilder: (BuildContext, i) {
                    return ListTile(
                      leading: Text((i + 1).toString()),
                      title: Text(todoModel[i].todoName),
                      subtitle: Text(
                        todoModel[i].todoStatus == '0'
                            ? 'Not Completed'
                            : 'Completed',
                        style: TextStyle(
                            color: todoModel[i].todoStatus == '0'
                                ? Colors.red
                                : Colors.green),
                      ),
                    );
                  },
                  itemCount: todoModel.length,
                ))
          ],
        ),
      ),
    );
  }
}
