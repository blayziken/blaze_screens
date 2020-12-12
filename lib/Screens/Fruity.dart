import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Fruity extends StatefulWidget {
  static const routeName = '/fruity-ui';
  @override
  _FruityState createState() => _FruityState();
}

class _FruityState extends State<Fruity> {
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
//        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.mail_outline,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'Email Address',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return;
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          size: 25.0,
          color: Colors.black,
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return;
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/back_png.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 25.0, bottom: 70.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 30.0, bottom: 70.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 55.0,
                              ),
                            ),
                            Text(
                              'Back!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 55.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Hey! Good to see you again.',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 60),
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              _buildEmail(),
                              SizedBox(
                                height: 20,
                              ),
                              _buildPassword(),
                            ],
                          ),
                        ),
                      )),
                ),
                Expanded(
//                  flex: 1,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: media.width * 0.8,
                          height: 54.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.black,
                            splashColor: Colors.red,
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();

                              print(_email);
                              print(_password);
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 20,
                            child: InkWell(
                              child: Text(
                                'Create an account?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Signup(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          child: InkWell(
                            child: Text(
                              'Need Help?',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// SIGN UP
class Signup extends StatelessWidget {
  static const routeName = '/fruity-ui';

  String _name;
  String _email;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _buildName() {
      return TextFormField(
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),

          border: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),

//
          prefixIcon: Icon(
            Icons.person_outline,
            size: 20.0,
          ),
          labelText: 'Name',
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Full Name is required';
          }

          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
      );
    }

    Widget _buildEmail() {
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),

//          focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Colors.red),
//            borderRadius: BorderRadius.circular(5),
//          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.mail_outline,
            size: 20.0,
//            color: Colors.red,
          ),
          labelText: 'Email Address',
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email is required';
          }

          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
      );
    }

    Widget _buildPassword() {
      return TextFormField(
        obscureText: true,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),

//          focusedBorder: OutlineInputBorder(
//            borderSide: BorderSide(color: Colors.red),
//            borderRadius: BorderRadius.circular(5),
//          ),
          border: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.lock_outline,
            size: 20.0,
//            color: Colors.red,
          ),
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.normal,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password is required';
          }

          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/front_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 38.0, top: 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 55.0,
                          ),
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          'We are happy to see you here!',
                          style: TextStyle(
                            color: Colors.pink[600],
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 38.0, right: 40.0),
                    child: Container(
                      width: double.infinity,
                      height: media.height * 0.7,
//                      color: Colors.tealAccent,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _buildName(),
                            _buildEmail(),
                            _buildPassword(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: media.width * 0.8,
                          height: 54.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.black,
                            splashColor: Colors.red,
                            onPressed: () {
                              if (!_formKey.currentState.validate()) {
                                return;
                              }

                              _formKey.currentState.save();

                              print(_name);
                              print(_email);
                              print(_password);
                            },
                            child: Text(
                              'Sign up me',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: InkWell(
                            child: Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Fruity(),
                                ),
                              );
                            },
                          ),
                        ),
                        InkWell(
                          child: Text(
                            'Need Help?',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Fruity(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
