import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_todo_app/create_todo_view.dart';

import 'utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedItem = 'Todo';

  final List<Map<String, dynamic>> _unCompletedData = [];
  final List<Map<String, dynamic>> _completedData = [];
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut eros id lectus volutpat imperdiet at a est. Quisque sodales est et tempor pulvinar. Aliquam sodales vehicula ipsum, eu placerat orci venenatis non. Etiam pulvinar sapien quis neque vestibulum varius. Ut vulputate congue neque in tincidunt. Praesent eu quam eget justo fringilla venenatis sit amet vel metus. Donec aliquet nunc vitae nibh viverra feugiat. Sed id dapibus ante, non suscipit ipsum. Vestibulum lacus augue, volutpat et lorem non, porttitor lacinia massa. Duis mattis lorem ipsum, vel rhoncus urna aliquet eget. Duis ex nisi, aliquam at arcu non, dictum euismod nisl.',
      'date_time': 'Today',
      'status': true,
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut eros id lectus volutpat imperdiet at a est. Quisque sodales est et tempor pulvinar. Aliquam sodales vehicula ipsum, eu placerat orci venenatis non. Etiam pulvinar sapien quis neque vestibulum varius. Ut vulputate congue neque in tincidunt. Praesent eu quam eget justo fringilla venenatis sit amet vel metus. Donec aliquet nunc vitae nibh viverra feugiat. Sed id dapibus ante, non suscipit ipsum. Vestibulum lacus augue, volutpat et lorem non, porttitor lacinia massa. Duis mattis lorem ipsum, vel rhoncus urna aliquet eget. Duis ex nisi, aliquam at arcu non, dictum euismod nisl.',
      'date_time': 'Yesterday',
      'status': true,
    },
    {
      'title':
          'Vestibulum ut eros id lectus volutpat imperdiet at a est. Quisque sodales est et tempor pulvinar. Aliquam sodales vehicula ipsum, eu placerat orci venenatis non. Etiam pulvinar sapien quis neque vestibulum varius. Ut vulputate congue neque in tincidunt. Praesent eu quam eget justo fringilla venenatis sit amet vel metus. Donec aliquet nunc vitae nibh viverra feugiat. Sed id dapibus ante, non suscipit ipsum. Vestibulum lacus augue, volutpat et lorem non, porttitor lacinia massa. Duis mattis lorem ipsum, vel rhoncus urna aliquet eget. Duis ex nisi, aliquam at arcu non, dictum euismod nisl.',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut eros id lectus volutpat imperdiet at a est. Quisque sodales est et tempor pulvinar. Aliquam sodales vehicula ipsum, eu placerat orci venenatis non. Etiam pulvinar sapien quis neque vestibulum varius. Ut vulputate congue neque in tincidunt. Praesent eu quam eget justo fringilla venenatis sit amet vel metus. Donec aliquet nunc vitae nibh viverra feugiat. Sed id dapibus ante, non suscipit ipsum. Vestibulum lacus augue, volutpat et lorem non, porttitor lacinia massa. Duis mattis lorem ipsum, vel rhoncus urna aliquet eget. Duis ex nisi, aliquam at arcu non, dictum euismod nisl.',
      'date_time': 'Tomorrow',
      'status': false,
    },
    {
      'title': 'Lorem ipsum dolor sit amet.',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut eros id lectus volutpat imperdiet at a est. Quisque sodales est et tempor pulvinar. Aliquam sodales vehicula ipsum, eu placerat orci venenatis non. Etiam pulvinar sapien quis neque vestibulum varius. Ut vulputate congue neque in tincidunt. Praesent eu quam eget justo fringilla venenatis sit amet vel metus. Donec aliquet nunc vitae nibh viverra feugiat. Sed id dapibus ante, non suscipit ipsum. Vestibulum lacus augue, volutpat et lorem non, porttitor lacinia massa. Duis mattis lorem ipsum, vel rhoncus urna aliquet eget. Duis ex nisi, aliquam at arcu non, dictum euismod nisl.',
      'date_time': 'Mon. 15 Nov',
      'status': false,
    },
    {
      'title': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ut eros id lectus volutpat imperdiet at a est. Quisque sodales est et tempor pulvinar. Aliquam sodales vehicula ipsum, eu placerat orci venenatis non. Etiam pulvinar sapien quis neque vestibulum varius. Ut vulputate congue neque in tincidunt. Praesent eu quam eget justo fringilla venenatis sit amet vel metus. Donec aliquet nunc vitae nibh viverra feugiat. Sed id dapibus ante, non suscipit ipsum. Vestibulum lacus augue, volutpat et lorem non, porttitor lacinia massa. Duis mattis lorem ipsum, vel rhoncus urna aliquet eget. Duis ex nisi, aliquam at arcu non, dictum euismod nisl.',
      'date_time': 'Today',
      'status': false,
    },
  ];
  @override
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (!element['status']) {
        _unCompletedData.add(element);
      } else {
        _completedData.add(element);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'My Tasks',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
          leading: const Center(
            child: FlutterLogo(
              size: 40,
            ),
          ),
          actions: [
            PopupMenuButton<String>(
                icon: const Icon(Icons.menu),
                onSelected: (value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      child: Text('Todo'),
                      value: 'Todo',
                    ),
                    const PopupMenuItem(
                      child: Text('Completed'),
                      value: 'Completed',
                    ),
                  ];
                }),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return CreateTodoView();
            }),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(34, 43, 103, 1),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return TaskCardWidget(
            dateTime: selectedItem == 'Todo'
                ? _unCompletedData[index]['date_time']
                : _completedData[index]['date_time'],
            title: selectedItem == 'Todo'
                ? _unCompletedData[index]['title']
                : _completedData[index]['title'],
            description: selectedItem == 'Todo'
                ? _unCompletedData[index]['description']
                : _completedData[index]['description'],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemCount: selectedItem == 'Todo'
            ? _unCompletedData.length
            : _completedData.length,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: (10), horizontal: (16)),
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          return TaskCardWidget(
                              dateTime: _completedData[index]['date_time'],
                              title: _completedData[index]['title'],
                              description: _completedData[index]
                                  ['description']);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: _completedData.length);
                  });
            },
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(34, 43, 103, 1),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Complete',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '${_completedData.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.dateTime})
      : super(key: key);

  final String title;
  final String description;
  final String dateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 30,
              color: customColor(
                date: dateTime,
              ),
              //const SizedBox(
              // width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(34, 43, 103, 1),
                    ),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: customColor(date: dateTime),
                ),
                Text(
                  dateTime,
                  style: TextStyle(
                    color: customColor(date: dateTime),
                  ),
                ),
              ],
            ),
            //),
          ],
        ),
      ),
    );
  }
}
