import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_lists.dart';
import 'package:quiz_app/screens/result_screen.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pge = 0;

  final PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isFalse = Colors.red;
  Color btnColor = Colors.white;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/img/back_compre.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                child: Text(
                  (widget.name),
                  style: const TextStyle(
                      color: Color(0xFF334B49),
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller!,
                  onPageChanged: (page) {
                    setState(() {
                      isPressed;
                    });
                  },
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(30)),
                          margin: const EdgeInsets.all(18),
                          // color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Domanda ${index + 1}/${questions.length}",
                                style: const TextStyle(
                                    color: Color(0xFF334B49),
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 30),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),

                              Text(
                                questions[index].question!,
                                style: const TextStyle(
                                  color: Color(0xFF042322),
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              for (int i = 0;
                                  i < questions[index].answer!.length;
                                  i++)
                                Container(
                                  width: double.infinity,
                                  height: 80.0,
                                  margin: const EdgeInsets.only(
                                    bottom: 10.0,
                                  ),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.0))),
                                  child: MaterialButton(
                                      color: isPressed
                                          ? questions[index]
                                                  .answer!
                                                  .entries
                                                  .toList()[i]
                                                  .value
                                              ? isTrue
                                              : isFalse
                                          : const Color(0xFF17b2aa),
                                      onPressed: isPressed
                                          ? () {}
                                          : () {
                                              setState(() {
                                                isPressed = true;
                                              });
                                              if (questions[index]
                                                  .answer!
                                                  .entries
                                                  .toList()[i]
                                                  .value) {
                                                score += 10;
                                              }
                                            },
                                      child: Text(
                                        questions[index]
                                            .answer!
                                            .keys
                                            .toList()[i],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: const Color(0xFF17b2aa)),
                                    child: TextButton(
                                      onPressed: isPressed
                                          ? index + 1 == questions.length
                                              ? () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ResultScreen(
                                                                  score)));
                                                }
                                              : () {
                                                  _controller!.nextPage(
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.ease);
                                                  setState(() {
                                                    isPressed = false;
                                                  });
                                                }
                                          : null,
                                      child: Text(
                                        index + 1 == questions.length
                                            ? "Vedi risultato"
                                            : "Prossima domanda",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 24),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
