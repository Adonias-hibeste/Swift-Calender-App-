import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarHomePage extends StatefulWidget {
  const CalendarHomePage({super.key});

  @override
  State<CalendarHomePage> createState() => _CalendarHomePageState();
}

class _CalendarHomePageState extends State<CalendarHomePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemBackground.withOpacity(0.8),
        middle: Text(
          DateFormat('MMMM yyyy').format(_focusedDay),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Month View Placeholder (Simplified for showcase)
            Container(
              padding: const EdgeInsets.all(16),
              color: CupertinoColors.systemBackground,
              child: Column(
                children: [
                  _buildWeekDays(),
                  const SizedBox(height: 10),
                  _buildCalendarGrid(),
                ],
              ),
            ),
            
            const Divider(height: 1, color: CupertinoColors.systemGrey5),
            
            // Events List
            Expanded(
              child: Container(
                color: CupertinoColors.extraLightBackgroundGray,
                child: ListView(
                  children: [
                    _buildEventItem("10:00 AM", "Product Sync", "AI Workspace", CupertinoColors.systemBlue),
                    _buildEventItem("1:30 PM", "Client Review", "Zoom Meeting", CupertinoColors.systemPurple),
                    _buildEventItem("4:00 PM", "Gym Session", "Fitness First", CupertinoColors.systemOrange),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekDays() {
    final days = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) => Text(
        day,
        style: const TextStyle(
          color: CupertinoColors.systemGrey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      )).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: 31,
      itemBuilder: (context, index) {
        final day = index + 1;
        final isSelected = day == DateTime.now().day;
        return Center(
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: isSelected ? CupertinoColors.systemBlue : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$day',
                style: TextStyle(
                  color: isSelected ? CupertinoColors.white : CupertinoColors.label,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEventItem(String time, String title, String location, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                location,
                style: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
