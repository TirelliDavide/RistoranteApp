import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: "Accedi al nostro sito"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}






  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  final snackBar = const SnackBar(content: Text("FORM TUTTO OK!"));

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.error,

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(

          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      keyboardType: TextInputType.emailAddress,

                      decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "Inserisci email",
                        hintText: "ex@example.com",
                      ),
                      validator: (value) {
                        if (!value!.contains('@')) {
                          return 'Inserisci una email valida';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide()),
                        labelText: "Inserisci password",
                        hintText: "ciao123",
                      ),
                      validator: (value) {
                        if (value == null || value.length<5 ) {
                          return 'Inserisci una password valida';
                        }
                        return null;
                      },
                    ),

                    OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text("Valida Form"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: const Text("Log In"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
