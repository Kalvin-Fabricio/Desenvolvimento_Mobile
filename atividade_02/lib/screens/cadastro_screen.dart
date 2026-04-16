import 'package:flutter/material.dart';
import 'confirmacao_screen.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String? _sexoSelecionado;
  bool _aceitouTermos = false;

  final List<String> _opcoesSexo = ['Masculino', 'Feminino', 'Outro'];

  void _validarECadastrar() {
    String erro = "";


    if (_nomeController.text.isEmpty) {
      erro = "O nome não pode ser vazio.";
    }

    else if (_idadeController.text.isEmpty) {
      erro = "A idade não pode ser vazia.";
    } else {
      try {
        int idade = int.parse(_idadeController.text);
        if (idade < 18) erro = "Você deve ter 18 anos ou mais.";
      } catch (e) {
        erro = "A idade deve ser um número válido.";
      }
    }


    if (erro == "" && (_emailController.text.isEmpty ||
        !_emailController.text.contains("@") ||
        !_emailController.text.contains("."))) {
      erro = "Insira um e-mail válido (contendo @ e .)";
    }


    if (erro == "" && _sexoSelecionado == null) {
      erro = "Selecione o sexo.";
    }


    if (erro == "" && !_aceitouTermos) {
      erro = "Você precisa aceitar os termos de uso.";
    }

    if (erro != "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(erro), backgroundColor: Colors.red),
      );
    } else {

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmacaoScreen(
            nome: _nomeController.text,
            idade: _idadeController.text,
            email: _emailController.text,
            sexo: _sexoSelecionado!,
            termos: _aceitouTermos,
          ),
        ),
      );
    }
  }


  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction action = TextInputAction.next,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: action,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Usuário"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Preencha os campos abaixo",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _buildTextField(
                controller: _nomeController, label: "Nome", hint: "Digite seu nome completo"),
            _buildTextField(
                controller: _idadeController,
                label: "Idade",
                hint: "Sua idade",
                keyboardType: TextInputType.number),
            _buildTextField(
                controller: _emailController,
                label: "Email",
                hint: "exemplo@email.com",
                keyboardType: TextInputType.emailAddress,
                action: TextInputAction.done),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _sexoSelecionado,
                  hint: const Text("Selecione o Sexo"),
                  isExpanded: true,
                  items: _opcoesSexo.map((String valor) {
                    return DropdownMenuItem(value: valor, child: Text(valor));
                  }).toList(),
                  onChanged: (novoValor) => setState(() => _sexoSelecionado = novoValor),
                ),
              ),
            ),

            const SizedBox(height: 10),

            CheckboxListTile(
              title: const Text("Aceito os termos de uso"),
              value: _aceitouTermos,
              onChanged: (valor) => setState(() => _aceitouTermos = valor!),
              controlAffinity: ListTileControlAffinity.leading,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _validarECadastrar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Cadastrar", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}