// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unjuk',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => LoginPage(),
      },
      initialRoute: '/',
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Image'),
    );
  }
}

class InfoPage extends StatelessWidget {
  String username;
  String password;
  InfoPage({required this.username, required this.password});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('your username : ${username}'),
          Text('Your Password : ${password}'),
          const SizedBox(
            height: 100,
          ),
          const SizedBox(
            width: 100,
          )
        ],
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  String username;

  String password;
  Dashboard({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0; // Indeks item yang dipilih

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _getBody(context, widget.username,
            widget.password), // Widget body yang berubah berdasarkan indeks
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.center_focus_strong),
              label: 'Text Center',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: 'Logout',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped, // Callback saat item ditekan
        ),
      ),
    );
  }

  // Callback untuk mengubah indeks saat item dipilih
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Widget body yang berubah berdasarkan indeks
  Widget _getBody(context, username, password) {
    if (_selectedIndex == 0) {
      // Tampilkan info username sebagai default
      return InfoPage(username: username, password: password);
    } else if (_selectedIndex == 1) {
      // Tampilkan teks "Text Center"
      return Center(
        child: Text('Text Center'),
      );
    } else if (_selectedIndex == 2) {
      // Pergi ke halaman login (misalnya dengan pushReplacement ke halaman login)
      return LoginPage();
    } else {
      // Indeks tidak valid, tampilkan halaman kosong
      return SizedBox();
    }
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      backgroundColor: const Color(0xff8c5cb2),
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/imagePeople.png')),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Log in to Shh!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/iconGoogle.png'),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Log in with Google',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Or log in with Email',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 100,
                          child: Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        controller: username,
                        decoration: const InputDecoration(
                          hintText: 'Username or Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          fillColor: Color.fromARGB(251, 255, 255, 255),
                          filled: true,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(),
                      margin: const EdgeInsets.only(),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          fillColor: Color.fromARGB(251, 255, 255, 255),
                          filled: true,
                          suffixIcon: InkWell(
                            child: Icon(
                              Icons.password_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(
                              username: username.text,
                              password: password.text,
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      'Don`t have an account?',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListMySc extends StatelessWidget {
  const ListMySc({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
