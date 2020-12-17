import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aboard extends StatelessWidget {
  static const routeName = '/aboard-ui';

  String _username;
  String _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    Widget _buildUserName() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Username',
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return;
          }

          return null;
        },
        onSaved: (String value) {
          _username = value;
        },
      );
    }

    Widget _buildPassword() {
      return TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
          enabledBorder: OutlineInputBorder(
//            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
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

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: media.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/multicolor-swirls.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
//                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'Welcome back, login to continue!',
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 35.0, left: 35.0, right: 35.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildUserName(),
                      _buildPassword(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 35.0, top: 10.0, bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Forgot password?',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: media.width * 0.92,
                      height: 55.0,
                      child: RaisedButton(
                        color: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          _formKey.currentState.save();

                          print(_username);
                          print(_password);
                        },
                        child: Text(
                          'Login to my Account',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: media.width * 0.92,
                      height: 55.0,
                      child: RaisedButton(
                        color: Colors.white60,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                        child: Text(
                          'Signup for New Account',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Signup extends StatelessWidget {
  String _name;
  String _email;
  String _username;
  String _password;

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Full Name',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
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
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is required';
        }

//        if(!RegExp().hasMatch(value)){
//          return 'Please enter a valid email address';
//        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildUserName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Username is required';
        }

        return null;
      },
      onSaved: (String value) {
        _username = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
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

  Widget _buildPhone() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Telephone',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.2)),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone required';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, bottom: 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.red,
                      size: 30.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                  child: Text(
                    'Let\'s sign you up!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    height: 460,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 60),
                        child: Form(
                          key: _formKey2,
                          child: Column(
//                          mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _buildName(),
                              _buildUserName(),
                              _buildPhone(),
                              _buildEmail(),
                              _buildPassword(),
                            ],
                          ),
                        )),
                  ),
                ),
                Center(
                  child: Container(
                    width: media.width * 0.3,
                    height: 55.0,
                    child: RaisedButton(
                      color: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      onPressed: () {
                        if (!_formKey2.currentState.validate()) {
                          return;
                        }

                        _formKey2.currentState.save();

                        print(_username);
                        print(_password);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
//                flex: 3,
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/multicolor-swirls.png'),
                        ),
                      ),
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

//enabledBorder: OutlineInputBorder(
////            borderRadius: BorderRadius.circular(0),
//borderSide: BorderSide(color: Colors.transparent),
//),
