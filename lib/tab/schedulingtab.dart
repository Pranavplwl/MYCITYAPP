import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class ScheduleItem {
  final DateTime dateTime;
  final String event;
  bool isDone;

  ScheduleItem({
    required this.dateTime,
    required this.event,
    this.isDone = false,
  });
}

class SchedulingTab extends StatefulWidget {
  const SchedulingTab({Key? key}) : super(key: key);

  @override
  _SchedulingTabState createState() => _SchedulingTabState();
}

class _SchedulingTabState extends State<SchedulingTab> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime =
      const TimeOfDay(hour: 13, minute: 0); 
  List<ScheduleItem> schedule = [];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  void addPickup(DateTime dateTime) {
    schedule.add(ScheduleItem(dateTime: dateTime, event: "Trash Pickup"));
    setState(() {});
  }

  void toggleDone(int index) {
    setState(() {
      schedule[index].isDone = !schedule[index].isDone;
    });
  }

  Future<void> _showConfirmationDialog(DateTime dateTime) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Booking'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Do you want to book this pickup for:'),
                Text(
                  DateFormat('MMMM d, yyyy - hh:mm a').format(dateTime),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                addPickup(dateTime);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedule Trash Pickup"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    "Available Time Intervals:",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: List.generate(8, (index) {
                      final hour = index + 13; 
                      final dateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        hour,
                        0,
                      );
                      return InkWell(
                        onTap: () async {
                          await _showConfirmationDialog(dateTime);
                        },
                        child: Chip(
                          label: Text(_formatTimeOfDay(
                              TimeOfDay(hour: hour, minute: 0))),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Booked Pickups:",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  const SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: schedule.length,
                    itemBuilder: (context, index) {
                      final item = schedule[index];
                      final timeFormat = DateFormat('h:mm a');
                      final dateFormat = DateFormat('d/M/y');
                      final timeString = timeFormat.format(item.dateTime);
                      final dateString = dateFormat.format(item.dateTime);
                      return Dismissible(
                        key: Key(item.dateTime.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20.0),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            schedule.removeAt(index);
                          });
                        },
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$timeString",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: item.isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                "$dateString - ${item.isDone ? "done" : "pending"}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  decoration: item.isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(item.event),
                          trailing: Checkbox(
                            value: item.isDone,
                            onChanged: (_) => toggleDone(index),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _selectDate(context);
          await _selectTime(context);
          final dateTime = DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
          await _showConfirmationDialog(dateTime);
        },
        label: const Text(
          'Custom Time',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
