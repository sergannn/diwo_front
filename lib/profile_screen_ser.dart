import 'package:flutter/material.dart';
import 'package:diwo_ligh/widgets/animated_widgets.dart';
//import 'package:google_fonts/google_fonts.dart';

//import 'package:yandex_maps_mapkit/yandex_maps_mapkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*
  await init.initMapkit(
    apiKey: 'YOUR_API_KEY'
  );
*/

  runApp(MaterialApp(home: ProfileScreenSer()));
}

class ProfileScreenSer extends StatefulWidget {
  const ProfileScreenSer({super.key});

  @override
  State<ProfileScreenSer> createState() => _MapScreenState();
}

class _MapScreenState extends State<ProfileScreenSer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Image.asset(
        'assets/images/bottom_bar.png',
      ), //, fit: BoxFit.cover),
      /*BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'Business'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
          ],
          currentIndex: 0,
          selectedItemColor: Colors.amber[800],
          onTap: (a) {},
        ),*/
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('AppBar with hamburger button'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: myDrawer(),
      backgroundColor: Colors.black,
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Первый элемент
                    Text("<"),
                    SizedBox(width: 8, height: 52),

                    // Второй элемент
                    Text("Профиль"),

                    // Гибкое пространство между вторым и третьим элементом
                    Spacer(),

                    // Третий элемент (прижат вправо)
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://placehold.co/80x80',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _ProfileCard(),
                SizedBox(height: 10),
                LinearChart(),
                SizedBox(height: 20),
                _StatsRow(),
                SizedBox(height: 20),
                _CoinsRow(),
                SizedBox(height: 20),
                _LargeProfileAvatar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Отдельные виджеты:

class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.black,
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          _ProfileAvatar(size: 125),
          SizedBox(width: 10),
          _ProfileInfo(),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  final double size;

  const _ProfileAvatar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
        border: Border.all(color: Colors.white, width: 2.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      // Можно добавить изображение вместо цвета
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Джек!"),
        SizedBox(height: 5),
        _FollowersInfo(),
        SizedBox(height: 10),
        _FriendAvatars(),
      ],
    );
  }
}

class _FollowersInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("a"), Text("followers"), Text("b|"), Text("Following")],
    );
  }
}

class _FriendAvatars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://placehold.co/80x80'),
        ),
        SizedBox(width: 5),
        CircleAvatar(
          backgroundImage: NetworkImage('https://placehold.co/80x80'),
        ),
        SizedBox(width: 5),
        CircleAvatar(
          backgroundImage: NetworkImage('https://placehold.co/80x80'),
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_StatCard(width: 167), _StatCard(width: 143)],
    );
  }
}

class _StatCard extends StatelessWidget {
  final double width;

  const _StatCard({required this.width});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: width,
      height: 85,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 2, 14, 24),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Color(0xFF11A8FD), width: 2),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF11A8FD).withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _StatIndicators(),
          SizedBox(height: 10),
          _StatMainIndicator(),
        ],
      ),
    );
  }
}

class _StatIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 20),
        Container(width: 10, height: 10, color: Colors.red),
        SizedBox(width: 20),
        Container(width: 10, height: 10, color: Colors.blue),
      ],
    );
  }
}

class _StatMainIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Container(width: 10, height: 10, color: Colors.white)],
    );
  }
}

class _CoinsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://placehold.co/80x80'),
        ),
        _SocialIndicators(),
        Spacer(),
        Container(width: 10, height: 10, color: Colors.green),
      ],
    );
  }
}

class _SocialIndicators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 10, height: 10, color: Colors.red),
        SizedBox(height: 5),
        Container(width: 10, height: 10, color: Colors.blue),
      ],
    );
  }
}

class _LargeProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage('https://placehold.co/80x80'),
      ),
    );
  }
}

Widget myDrawer() {
  return Drawer(
    //      elevation: -1,
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        // Important: Remove any padding from the ListView.
        // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        children: [
          SizedBox(height: 100),
          //HeaderOfDrawer(),
          SizedBox(height: 100),
          Column(
            children: [
              //Collection1(),
              SizedBox(height: 20),
              //Collection1(),
              SizedBox(height: 20),
              //Collection1()
            ],
          ),
          SizedBox(height: 50),
          //FooterOfDrawer(),
          SizedBox(height: 20),
        ],
      ),
    ),
  );
}
