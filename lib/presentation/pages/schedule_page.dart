import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'event_detail_page.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        border: null,
        middle: Text('Schedule', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
        trailing: Icon(CupertinoIcons.calendar, color: Colors.blue),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildTimeline(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Tuesday, March 29', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600)),
            Text('6 tasks planned', style: TextStyle(color: Colors.black26, fontSize: 12)),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(color: Colors.blue.withOpacity(0.05), borderRadius: BorderRadius.circular(20)),
          child: const Text('Busy day', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
        ),
      ],
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Column(
      children: [
        _buildTimelineItem(context, '08:30', 'Product sync', 'Conference room A • 45 min', Colors.blue, true),
        _buildTimelineItem(context, '10:00', 'Brand concept review', 'Creative team • 1 hour', Colors.purple, false),
        _buildTimelineItem(context, '12:30', 'Client lunch', 'Rooftop table • 90 min', Colors.orange, false),
        _buildTimelineItem(context, '15:00', 'Prototype handoff', 'Send final assets • 30 min', Colors.blue, false),
        _buildTimelineItem(context, '17:30', 'Hiring debrief', 'People ops • 40 min', Colors.purple, false),
      ],
    );
  }

  Widget _buildTimelineItem(BuildContext context, String time, String title, String sub, Color color, bool isFirst) {
    return GestureDetector(
      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const EventDetailPage())),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(time, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
          ),
          Column(
            children: [
              Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              Container(width: 2, height: 100, color: color.withOpacity(0.2)),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        child: Text(color == Colors.blue ? 'Work' : 'Team', style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(sub, style: const TextStyle(color: Colors.black38, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
