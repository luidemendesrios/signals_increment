import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter usando Signals',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MyHomePage(title: 'Flutter Increment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //1 - O app utiliza o pacote signals para gerenciar o estado do contador.
 final counter = signal<int>(0); //Um sinal chamado counter é criado com o valor inicial de 0.

  void _incrementCounter() {
    counter.value++; //O método _incrementCounter incrementa o valor do sinal, atualizando o estado da aplicação.
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Click no botão para incrementar valores',
            ),
            Text(
              '${counter.watch(context)}', //2 - O widget Text que exibe o valor do contador usa o método watch do sinal para obter o valor atual.
              style: const TextStyle(fontSize: 34),//Quando o valor do sinal muda, o widget Text é automaticamente reconstruído para refletir a alteração.
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, //3
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
/**
 * O FloatingActionButton tem a função de incrementar o contador quando pressionado.
O método _incrementCounter é chamado quando o botão é pressionado, atualizando o valor do sinal e, consequentemente, acionando a reconstrução da interface.
 */