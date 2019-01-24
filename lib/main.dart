import 'package:flutter/material.dart';
import 'thirdActivity.dart';
void main() => runApp(MyApp());

final pColor = Color(0xFF0A79DF);
final aColor = Color(0xFF2475B0);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: pColor,
        accentColor: aColor,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.decelerate,
    );
    _iconAnimation.addListener(
      () => this.setState(() {}),
    );
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/Background.jpg'),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.darken,
            color: Colors.black87,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'Logo',
                child: FlutterLogo(
                  size: _iconAnimation.value * 150,
                ),
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    accentColor: aColor,
                    brightness: Brightness.dark,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: pColor,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            hintStyle: TextStyle(
                              color: pColor,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintStyle: TextStyle(
                              color: pColor,
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThirdActivity()));
                          },
                          color: pColor,
                          textColor: Color(0xFFEAF0F1),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 25),
                          ),
                          splashColor: Color(0xFF74B9FF),
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
