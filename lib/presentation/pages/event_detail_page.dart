import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        border: null,
        trailing: Icon(CupertinoIcons.xmark_circle_fill, color: Colors.black12, size: 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Event', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w600)),
              const Text('Product Sync', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              _buildDetailItem('Starts', 'Today, 2:30 PM', 'On time', Colors.blue),
              const SizedBox(height: 16),
              _buildDetailItem('Duration', '45 minutes', null, Colors.purple),
              const SizedBox(height: 16),
              _buildDetailItem('Participants', 'Design team • Product leads', null, Colors.blue),
              const SizedBox(height: 32),
              _buildLocationCard(),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      child: const Text('View agenda', style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                      child: const Text('Share', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, String? badge, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(label == 'Starts' ? CupertinoIcons.time : CupertinoIcons.person_2, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.black38, fontSize: 12)),
                Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
          ),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(border: Border.all(color: color.withOpacity(0.3)), borderRadius: BorderRadius.circular(15)),
              child: Text(badge, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }

  Widget _buildLocationCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('North Studio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Building A • Floor 3', style: TextStyle(color: Colors.black38, fontSize: 14)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(border: Border.all(color: Colors.black12), borderRadius: BorderRadius.circular(15)),
                child: const Text('Map', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(CupertinoIcons.location_fill, color: Colors.blue, size: 18),
              const SizedBox(width: 8),
              const Text('12-minute walk from current location', style: TextStyle(color: Colors.black45, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
