import 'package:flutter/material.dart';
import 'package:quiz_app/screens/quiz_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
 String name = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),*/
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/img/back_compre.jpg'), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: const Offset(0, 7),
                ),
              ],
            ),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                  ),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        'QuizLand',
                        style: TextStyle(
                          color: Color(0xFF17b2aa),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    onChanged: (val) => name = "Ciao $val",
                    validator: (String? value) {
                      if (value!.isNotEmpty && value.length > 2) {
                        return null;
                      } else if (value.isNotEmpty && value.length < 3) {
                        return 'Il nome è corto';
                      } else {
                        return 'Per favore inserisci il tuo nome';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Inserisci nome utente',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF17b2aa)),
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(name:name)));
                            } else {
                              return;
                            }
                            /*  Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(name: name)));*/
                          },
                          child: const Text(
                            'Entra',
                            style: TextStyle(
                                fontSize: 35, color: Colors.white),
                          ),
                          style: TextButton.styleFrom(
                              //onSurface: const Color(0xFF466CAC),
                              minimumSize: const Size(200, 60))),
                    ),
                  ],
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    ));
  }
}
