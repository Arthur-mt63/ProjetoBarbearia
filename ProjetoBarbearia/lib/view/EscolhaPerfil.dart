import 'package:flutter/material.dart';

class EscolhaPerfil extends StatefulWidget {
  @override
  _EscolhaPerfilState createState() => _EscolhaPerfilState();
}

class _EscolhaPerfilState extends State<EscolhaPerfil> {
  String? selectedProfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (selectedProfile == null) ...[
            Icon(
              Icons.account_circle,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Selecione o seu perfil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
          ],
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: selectedProfile == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                  : selectedProfile == 'Barbearia'
                      ? BarberForm() // Formulário do barbeiro
                      : ClienteForm(), // Formulário do cliente
            ),
          ),
          SizedBox(height: 20),
        ],
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

// Formulário para o Barbeiro
class BarberForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Nome completo',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Data de nascimento',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Número de telefone',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Bairro do estabelecimento',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'CEP',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Nome da barbearia',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// Formulário para o Cliente
class ClienteForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Nome',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Telefone',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Endereço',
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
