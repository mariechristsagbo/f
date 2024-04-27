import 'package:devoir_final/pages/second_page.dart';
import 'package:flutter/material.dart';
import '../models/person_dart.dart';
import 'add_candidate_form.dart';

class CandidateListPage extends StatefulWidget {
  const CandidateListPage({super.key});

  @override
  State<CandidateListPage> createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  String name = "";
  bool liked = false;
  List<Candidate> persons = [];
  List<Candidate> friends = [];


  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      appBar: AppBar(
        title: Text('Elections 🇧🇯​🇧🇯​', style: TextStyle (
            fontSize: 22,
            fontFamily: 'Montserrat'
        ),),
        centerTitle: true,
      ),

      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  Candidate person = persons[index];
                  return Container(
                    padding: EdgeInsets.only(top: 14),
                    child:
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondPage(person: person)),
                        );
                      },
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  person.image,
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${person.name} ${person.surname}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      person.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  );
                },
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[50],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Candidats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Vote',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Candidate person = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCandidateForm (),

              ));

          setState(() => persons.add(person));

        },
        backgroundColor: Colors.tealAccent,
        child: Icon(Icons.add),
      ),



    );
  }

  bool checkIfExists(Candidate person) {
    return friends.contains(person);
  }

  void addFriend(Candidate person) {
    if (!checkIfExists(person)) {
      friends.add(person);
    } else {
      friends.remove(person);
    }
  }


}
