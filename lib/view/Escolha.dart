import 'package:flutter/material.dart';
import 'package:app/view/Ini_Barbeiro.dart';
import 'package:app/view/Ini_cliente.dart';
import 'package:app/view/tela_cadastro_cliente.dart';
import 'package:app/view/tela_casdastro_barbeiro.dart';
// Certifique-se de que o caminho esteja correto

class EscolhaTela extends StatefulWidget {
  @override
  _SelectProfileScreenState createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<EscolhaTela> {
  String? selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;

          return Container(
            color: Colors.black, // Cor de fundo preta
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone acima do texto "Selecione o seu perfil"
                Icon(
                  Icons.account_circle, // Ícone de perfil
                  size: isWideScreen
                      ? 120
                      : 100, // Ajuste o tamanho do ícone com base na largura da tela
                  color: Colors.white, // Cor do ícone
                ),
                SizedBox(height: 20), // Espaço entre o ícone e o texto

                Text(
                  'Selecione o seu perfil',
                  style: TextStyle(
                    fontSize: isWideScreen
                        ? 28
                        : 24, // Ajuste o tamanho da fonte com base na largura da tela
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Cor do texto branca para contraste
                  ),
                ),
                SizedBox(height: 40),

                Expanded(
                  child: ListView(
                    children: [
                      ProfileOption(
                        title: 'Barbearia',
                        description: 'Quero oferecer os serviços',
                        icon: Icons.store,
                        selected: selectedProfile == 'Barbearia',
                        onTap: () {
                          setState(() {
                            selectedProfile = 'Barbearia';
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      ProfileOption(
                        title: 'Cliente',
                        description:
                            'Encontre as barbearias mais próximas de você',
                        icon: Icons.person,
                        selected: selectedProfile == 'Cliente',
                        onTap: () {
                          setState(() {
                            selectedProfile = 'Cliente';
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: selectedProfile != null
                      ? () {
                          if (selectedProfile == 'Cliente') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastroClientePage()),
                            );
                          } else if (selectedProfile == 'Barbearia') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CadastroBarbeiroPage()),
                            );
                          }
                        }
                      : null,
                  icon: Icon(Icons.arrow_forward), // Ícone de seta para frente
                  label: Text('Continuar'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: isWideScreen ? 20 : 18),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  ProfileOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.blueAccent : Colors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
