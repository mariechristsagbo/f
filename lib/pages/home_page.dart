import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/african.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.withOpacity(0.5),
                    Colors.yellow.withOpacity(0.5),
                    Colors.red.withOpacity(0.5),
                  ],
                ),
              ),
              height: height / 2,
            ),
            SizedBox(
              height: 10,
              child: Row(
                children: [
                  Expanded(
                    child: Container(color: Colors.green),
                  ),
                  Expanded(
                    child: Container(color: Colors.yellow),
                  ),
                  Expanded(
                    child: Container(color: Colors.red),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/republic.png',
                                width: 70,
                                height: 70,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.how_to_vote),
                            Text(
                              'BJ-ÉLECTIONS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Montserrat'
                              ),
                            ),
                            Text(
                              'La démocratie transparente',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Montserrat'
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Le vote est un devoir en ligne',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Chaque citoyen a le droit de prendre part à la vie politique en général.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat'
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.how_to_vote,
                            color: Colors.teal[800],
                            size: 120,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal[800],
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text(
            'Continuer',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat'
            ),
          ),
        ),
      ),
    );
  }
}
