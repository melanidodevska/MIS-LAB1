import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';


class HomeScreen extends StatelessWidget {
  final List<Exam> ispiti = [
    Exam(
      imeNaPredmet: "Објектно-ориентирано програмирање",
      datumIVreme: DateTime(2023, 2, 15, 9, 0),
      prostorii: ["138", "117"],
    ),
    Exam(
      imeNaPredmet: "Структурно програмирање",
      datumIVreme: DateTime(2023, 2, 10, 14, 0),
      prostorii: ["200AБ"],
    ),
    Exam(
      imeNaPredmet: "Веб програмирање",
      datumIVreme: DateTime(2025, 2, 18, 10, 30),
      prostorii: ["12", "13"],
    ),
    Exam(
      imeNaPredmet: "Напредна интеракција човек компјутер",
      datumIVreme: DateTime(2026, 2, 12, 16, 0),
      prostorii: ["112"],
    ),
    Exam(
      imeNaPredmet: "Дискретна математика",
      datumIVreme: DateTime(2024, 2, 8, 8, 0),
      prostorii: ["200А", "138"],
    ),
    Exam(
      imeNaPredmet: "Бизнис статистика",
      datumIVreme: DateTime(2024, 2, 20, 11, 0),
      prostorii: ["2"],
    ),
    Exam(
      imeNaPredmet: "Оперативни системи",
      datumIVreme: DateTime(2024, 2, 22, 13, 30),
      prostorii: ["138", "200Б"],
    ),
    Exam(
      imeNaPredmet: "Мобилни информациски системи",
      datumIVreme: DateTime(2026, 2, 25, 15, 0),
      prostorii: ["117"],
    ),
    Exam(
      imeNaPredmet: "Софтверско инженерство",
      datumIVreme: DateTime(2024, 2, 28, 9, 30),
      prostorii: ["2", "3"],
    ),
    Exam(
      imeNaPredmet: "Напредно програмирање",
      datumIVreme: DateTime(2026, 3, 1, 12, 0),
      prostorii: ["200АБ"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final sortedIspiti = List<Exam>.from(ispiti);
    sortedIspiti.sort((a, b) => a.datumIVreme.compareTo(b.datumIVreme));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 223150"),
        backgroundColor: Colors.orange[700],
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            )
        ),
        elevation: 4,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sortedIspiti.length,
              itemBuilder: (context, index) {
                return ExamCard(
                  ispit: sortedIspiti[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: sortedIspiti[index],
                    );
                  },
                );
              },
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[700],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.format_list_numbered,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  "Вкупно испити: ${sortedIspiti.length}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}