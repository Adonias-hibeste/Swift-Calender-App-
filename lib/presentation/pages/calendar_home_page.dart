import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'schedule_page.dart';

class CalendarHomePage extends ConsumerWidget {
  const CalendarHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        border: null,
        middle: Text('March 2026', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        leading: Icon(CupertinoIcons.chevron_left, color: Colors.black54),
        trailing: Icon(CupertinoIcons.plus, color: Colors.blue),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildTodayHighlight(),
            const SizedBox(height: 24),
            _buildCalendarGrid(),
            const SizedBox(height: 32),
            _buildUpcomingSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayHighlight() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 20, offset: const Offset(0, 10))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Product review', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: const Text('3 events', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text('2:30 PM • Studio Room', style: TextStyle(color: Colors.black45)),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  .map((d) => Text(d, style: const TextStyle(color: Colors.black38, fontSize: 12, fontWeight: FontWeight.bold)))
                  .toList(),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemCount: 35,
              itemBuilder: (context, index) {
                final day = index - 3;
                if (day < 1) return const SizedBox();
                final isSelected = day == 29;
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black.withOpacity(0.05)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$day', style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
                      if (day % 3 == 0) ...[
                        const SizedBox(height: 4),
                        Container(width: 4, height: 4, decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.blue, shape: BoxShape.circle)),
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Upcoming', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Text('View all', style: TextStyle(fontSize: 14)),
                onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const SchedulePage())),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildUpcomingItem('Design sync', 'Tue • 10:00 AM', Colors.blue),
          const SizedBox(height: 12),
          _buildUpcomingItem('Client lunch', 'Thu • 12:30 PM', Colors.orange),
        ],
      ),
    );
  }

  Widget _buildUpcomingItem(String title, String time, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.05), borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(color: Colors.black45, fontSize: 12)),
              ],
            ),
          ),
          Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        ],
      ),
    );
  }
}
