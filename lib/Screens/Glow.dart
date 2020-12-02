import 'package:flutter/material.dart';
//import 'package:avatar_glow/avatar_glow.dart';

//class GlowScreen extends StatelessWidget {
//  static const routeName = '/glow-ui';
//
//  @override
//  Widget build(BuildContext context) {
//    var media = MediaQuery.of(context).size;
//    return Scaffold(
//      body: Container(
//        height: media.height,
//        width: double.infinity,
//        color: Colors.red[600],
//        child: Column(
////          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Spacer(),
//            Expanded(
//              flex: 2,
//              child: CircleAvatar(
//                backgroundColor: Colors.white,
//                radius: 90.0,
//                child: Icon(
//                  Icons.person,
//                  size: 100,
//                  color: Colors.red,
//                ),
//              ),
//            ),
//            Expanded(
//              child: Column(
//                children: <Widget>[
//                  Text(
//                    'Durar HR',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 45.0,
//                      fontWeight: FontWeight.bold,
//                      letterSpacing: 2,
//                    ),
//                  ),
//                  SizedBox(
//                    height: 5.0,
//                  ),
//                  Text(
//                    'The Complete HR Solutions',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20.0,
//                      fontWeight: FontWeight.w300,
////                      letterSpacing: 2,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

class GlowScreen extends StatelessWidget {
  static const routeName = '/glow-ui';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: media.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.red,
                    size: 30.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                flex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Welcome',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 37.0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Back! 🦅',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),

//                    Text(
//                      'Create An Account',
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        fontSize: 37.0,
//                      ),
//                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 15.0),
                      child: Text(
                        'Purchase till you drop.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 17.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, bottom: 60.0, right: 60),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
//                        _buildEmail(),
//                        _buildPassword(),
                        ],
                      ),
                    )),
              ),
              Spacer(),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: FlatButton(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.red,
                          size: 40.0,
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          _formKey.currentState.save();
                        },
                      ),
                    ),
//                      Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
