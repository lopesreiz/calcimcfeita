import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IMCCalculatorPage(),
    );
  }
}

class IMCCalculatorPage extends StatefulWidget {
  @override
  _IMCCalculatorPageState createState() => _IMCCalculatorPageState();
}

class _IMCCalculatorPageState extends State<IMCCalculatorPage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String _imcResult = '';
  String _imcClassificacao = '';
  String _imageUrl = 'https://images.unsplash.com/photo-1693205801547-74c8e8e6c013?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  bool isPesoSelected = true;

  void addNumber(String number) {
    setState(() {
      if (isPesoSelected) {
        _pesoController.text += number;
      } else {
        _alturaController.text += number;
      }
    });
  }

  void toggleField() {
    setState(() {
      isPesoSelected = !isPesoSelected;
    });
  }

  void clearFields() {
    setState(() {
      _pesoController.clear();
      _alturaController.clear();
      _imcResult = '';
      _imcClassificacao = '';
      _imageUrl = 'https://images.unsplash.com/photo-1693205801547-74c8e8e6c013?q=80&w=1742&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    });
  }

  void calculateIMC() {
    setState(() {
      try {
        double peso = double.parse(_pesoController.text);
        double altura = double.parse(_alturaController.text);

        if (peso == 0) {
          _imcResult = 'Peso não pode ser zero!';
         _imcClassificacao = '';
        } else if (altura == 0) {
          _imcResult = 'Altura não pode ser zero!';
          _imcClassificacao = '';
        } else {
          double imc = peso / (altura * altura);
          _imcResult = 'IMC: ${imc.toStringAsFixed(2)}';

          if (imc < 16) {
            _imcClassificacao = 'Magreza grau III';
            _imageUrl = 'https://imgs.search.brave.com/oyEbMnVSWTjzKVuHZuMYtsLV07Z5FYyxF9gqJDDLgZ0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMucHJlcGFyYWVu/ZW0uY29tLzIwMjQv/MDEvcmVuZGVyaXph/Y2FvLWRvLWVzcXVl/bGV0by1odW1hbm8u/anBn'; 
          } else if (imc >= 16 && imc <= 16.9) {
            _imcClassificacao = 'Magreza grau II';
            _imageUrl = 'https://imgs.search.brave.com/oyEbMnVSWTjzKVuHZuMYtsLV07Z5FYyxF9gqJDDLgZ0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWMucHJlcGFyYWVu/ZW0uY29tLzIwMjQv/MDEvcmVuZGVyaXph/Y2FvLWRvLWVzcXVl/bGV0by1odW1hbm8u/anBn'; 
          } else if (imc >= 17 && imc <= 18.4) {
            _imcClassificacao = 'Magreza grau I';
            _imageUrl = 'https://imgs.search.brave.com/GTsw8eU_nRrYsrcovpDmEGObfUcKcsq3VdTDTBp6mfQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9iZWxl/emFlc2F1ZGUuY29t/L2kvNzMwLzIwMTQv/Y29tby1lbmdvcmRh/ci5qcGc'; 
          } else if (imc >= 18.5 && imc <= 24.9) {
            _imcClassificacao = 'Eutrofia';
            _imageUrl = 'https://imgs.search.brave.com/k8ZYS11L-WcSlLjAavvw2FZeUxfzMTaMRAjXVQBOebI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/aWNyMS5ibGFzdGlu/Z2Nkbi5jb20vbWVk/aWEvcGhvdG9nYWxs/ZXJ5LzIwMTcvMy8y/OS82NjB4MjkwL2Jf/NTAyeDIyMHg4Mi9v/LXF1ZS1lLXNlci11/bWEtcGVzc29hLW5v/cm1hbC1kZXNjdWJy/YV8xMjM4ODE1Lmpw/Zw'; 
          } else if (imc >= 25 && imc <= 29.9) {
            _imcClassificacao = 'Pré-obesidade';
            _imageUrl = 'https://imgs.search.brave.com/K3RQrzFY7iPms8zflNLa78bTyEeZ8TcnNWaNED6FYGs/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y2VwaWMuY29tLmJy/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIw/LzA3L3NodXR0ZXJz/dG9ja181NzI4NjE0/OTEuanBn'; 
          } else if (imc >= 30 && imc <= 34.9) {
            _imcClassificacao = 'Obesidade moderada (grau I)';
            _imageUrl = 'https://imgs.search.brave.com/K3RQrzFY7iPms8zflNLa78bTyEeZ8TcnNWaNED6FYGs/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/Y2VwaWMuY29tLmJy/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIw/LzA3L3NodXR0ZXJz/dG9ja181NzI4NjE0/OTEuanBn'; 
          } else if (imc >= 35 && imc <= 39.9) {
            _imcClassificacao = 'Obesidade severa (grau II)';
            _imageUrl = 'https://imgs.search.brave.com/ABG7t7XPGle7dUYDJbYglq2nvnNPbJwohsRBLe4t464/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bWRzYXVkZS5jb20v/d3AtY29udGVudC91/cGxvYWRzL29iZXNp/ZGFkZS1pbWFnZW0t/NzMzeDQyMC5qcGc'; 
          } else if (imc >= 40) {
            _imcClassificacao = 'Obesidade muito severa (grau III)';
            _imageUrl = 'https://imgs.search.brave.com/B9wG7pj4yvo5QiVmHfA8ZA60nJ3ZVi2fn-GhZP-5k5M/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/bWRzYXVkZS5jb20v/d3AtY29udGVudC91/cGxvYWRzL29iZXNp/ZGFkZS1pbWFnZW0t/NzMzeDQyMC5qcGc'; 
          }
        }
      } catch (e) {
        _imcResult = 'Erro! Verifique os valores.';
        _imcClassificacao = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.2,
              child: Image.network(
                _imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _pesoController,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  hintText: 'Digite o Peso',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                readOnly: true,
                onTap: () => setState(() {
                  isPesoSelected = true;
                }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _alturaController,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  hintText: 'Digite a Altura',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
                readOnly: true,
                onTap: () => setState(() {
                  isPesoSelected = false;
                }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                Text(
                  _imcResult,
                  style: TextStyle(fontSize: screenHeight * 0.03, color: Colors.black54),
                ),
                Text(
                  _imcClassificacao,
                  style: TextStyle(fontSize: screenHeight * 0.025, color: Colors.black87),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: EdgeInsets.all(screenWidth * 0.04),
              mainAxisSpacing: screenWidth * 0.02,
              crossAxisSpacing: screenWidth * 0.02,
              children: [
                for (var i = 1; i <= 9; i++)
                  ElevatedButton(
                    onPressed: () {
                      addNumber('$i');
                    },
                    child: Text('$i'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      textStyle: TextStyle(
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    addNumber('.');
                  },
                  child: Text('.'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    addNumber('0');
                  },
                  child: Text('0'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    toggleField();
                  },
                  child: Text('ENTER'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    clearFields();
                  },
                  child: Text('CLEAR'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculateIMC();
                  },
                  child: Text('CALC'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    textStyle: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
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
