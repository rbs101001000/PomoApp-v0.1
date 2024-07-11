import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MotivationalText extends StatefulWidget {
  const MotivationalText({super.key});

  @override
  State<MotivationalText> createState() => _MotivationalTextState();
}

class _MotivationalTextState extends State<MotivationalText> {
  late Future<List<dynamic>> _motivationalQuotes;

  @override
  void initState() {
    super.initState();
    _motivationalQuotes = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final uri = Uri.parse('https://type.fit/api/quotes');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data;
    } else {
      throw Exception('Failed to fetch motivational quotes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 9,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        child: GestureDetector(
          onDoubleTap: (){
            setState(() {
              fetchData();
            });
          },
          child: FutureBuilder<List<dynamic>>(
            future: _motivationalQuotes,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final motivationalT = snapshot.data!.map((item) => item['text'] as String).toList();
                if (motivationalT.isNotEmpty) {
                  return ReusableCard(
                    borderRadius: 20,
                    colour: Colors.white12,
                    childCard: Text(
                      motivationalT[Random().nextInt(15)],
                      style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return const ReusableCard(
                    borderRadius: 20,
                    colour: Colors.white12,
                    childCard: Text(
                      'No motivational quotes available',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              } else if (snapshot.hasError) {
                return const ReusableCard(
                  borderRadius: 20,
                  colour: Colors.white12,
                  childCard: Text(
                    'Error fetching motivational quotes',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              } else {
                return const ReusableCard(
                  borderRadius: 20,
                  colour: Colors.white12,
                  childCard:LinearProgressIndicator(color: Colors.white,),

                );
              }
            },
          ),
        ),
      ),
    );
  }
}