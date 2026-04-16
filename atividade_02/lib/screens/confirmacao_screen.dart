import 'package:flutter/material.dart';

class ConfirmacaoScreen extends StatelessWidget {
  final String nome;
  final String idade;
  final String email;
  final String sexo;
  final bool termos;

  const ConfirmacaoScreen({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.termos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirmação")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Dados Informados:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Divider(),
            const SizedBox(height: 10),
            Text("Nome: $nome", style: const TextStyle(fontSize: 18)),
            Text("Idade: $idade", style: const TextStyle(fontSize: 18)),
            Text("Email: $email", style: const TextStyle(fontSize: 18)),
            Text("Sexo: $sexo", style: const TextStyle(fontSize: 18)),
            Text("Termos aceitos: ${termos ? 'Sim' : 'Não'}",
                style: const TextStyle(fontSize: 18)),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Voltar"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                    child: const Text("Editar"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}