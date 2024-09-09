import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seja bem-vindo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              'Sexta, 30 ago 2024',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {
              // Ação ao clicar no ícone de notificação
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  hintText: 'Encontre um estabelecimento',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 180,
                child: PageView(
                  children: [
                    _buildCarouselItem('assets/banner1.png'), // Substitua pelos caminhos das suas imagens
                    _buildCarouselItem('assets/banner2.png'),
                    _buildCarouselItem('assets/banner3.png'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Próximos a você',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildNearbyItem('assets/logo1.png', 'Distrito63 Barberclub', '450 m'),
                    _buildNearbyItem('assets/logo2.png', 'Wenderson Barber', '580 m'),
                    _buildNearbyItem('assets/logo3.png', 'Chefão Barbearia', '750 m'),
                    _buildNearbyItem('assets/logo4.png', 'Imperial Barbearia', '810 m'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Todos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildAllBarbershopsItem(
                logo: 'assets/logo5.png',
                name: 'Texas Country Barber',
                location: 'São Marcos/RS',
                address: 'Padre Feijo 252, 15 - 95190-000 centro - São Marcos/RS',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Agendamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildNearbyItem(String logoPath, String name, String distance) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(logoPath),
            radius: 30,
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 2),
          Text(
            distance,
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllBarbershopsItem({
    required String logo,
    required String name,
    required String location,
    required String address,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(logo),
        radius: 30,
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(location, style: TextStyle(color: Colors.grey)),
          Text(address, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}