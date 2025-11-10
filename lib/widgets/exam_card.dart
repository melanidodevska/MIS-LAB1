import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam ispit;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.ispit,
    required this.onTap,
  });

  Color _getCardColor(DateTime examDate) {
    final now = DateTime.now();
    if (examDate.isBefore(now)) {
      return Colors.grey[300]!;
    } else {
      return Colors.white;
    }
  }

  Color _getTextColor(DateTime examDate) {
    final now = DateTime.now();
    if (examDate.isBefore(now)) {
      return Colors.grey[600]!;
    } else {
      return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPast = ispit.datumIVreme.isBefore(DateTime.now());

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        color: _getCardColor(ispit.datumIVreme),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isPast ? Colors.grey[400]! : Colors.blue[100]!,
            width: 1,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.school,
                      color: isPast ? Colors.grey : Colors.orange[700],
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        ispit.imeNaPredmet,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: _getTextColor(ispit.datumIVreme),
                        ),
                      ),
                    ),
                    if (isPast)
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),
                  ],
                ),

                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: isPast ? Colors.grey : Colors.orange[700],
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${ispit.datumIVreme.day}.${ispit.datumIVreme.month}.${ispit.datumIVreme.year}",
                      style: TextStyle(
                        fontSize: 14,
                        color: _getTextColor(ispit.datumIVreme),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      Icons.access_time,
                      color: isPast ? Colors.grey : Colors.orange[700],
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${ispit.datumIVreme.hour.toString().padLeft(2, '0')}:${ispit.datumIVreme.minute.toString().padLeft(2, '0')}",
                      style: TextStyle(
                        fontSize: 14,
                        color: _getTextColor(ispit.datumIVreme),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: isPast ? Colors.grey : Colors.orange[700],
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Простории: ${ispit.prostorii.join(', ')}",
                        style: TextStyle(
                          fontSize: 14,
                          color: _getTextColor(ispit.datumIVreme),
                        ),
                      ),
                    ),
                  ],
                ),

                if (!isPast) ...[
                  const SizedBox(height: 8),
                  FutureBuilder<Duration>(
                    future: Future.value(ispit.datumIVreme.difference(DateTime.now())),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final duration = snapshot.data!;
                        final days = duration.inDays;
                        final hours = duration.inHours % 24;

                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}