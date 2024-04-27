import 'package:flutter/material.dart';
import 'package:devoir_final/common/I_button.dart';
import 'package:devoir_final/common/i_input.dart';
import 'package:devoir_final/models/person_dart.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class AddCandidateForm extends StatefulWidget {
  const AddCandidateForm({super.key});

  @override
  State<AddCandidateForm> createState() => _AddCandidateFormState();
}

class _AddCandidateFormState extends State<AddCandidateForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? birthdate;
  final Candidate person= Candidate();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print("Image path: ${image.path}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Création d'un candidat", style:
          TextStyle(
            fontFamily: 'Montserrat'
          ),),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

            GestureDetector(
            onTap: _pickImage,
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera, size: 40,),
                    SizedBox(height: 10),
                    Text('Appuyez pour ajouter une image',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

              IIinput(
                name: 'Nom',
                innermargin: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.name=value;

                },

                prefixIcon: Icon(Icons.person),
              ),


              SizedBox(height: 15.0,),
              IIinput(
                name: 'Prénom(s)',
                innermargin: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.surname=value;

                },

                prefixIcon: Icon(Icons.person),

              ),
              SizedBox(height: 15,),

              IIinput(
                name: 'Parti politique',
                innermargin: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.description=value;

                },

                prefixIcon: Icon(Icons.flag),

              ),

              SizedBox(height: 15,),

              IIinput(
                name: 'Description',
                innermargin: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return " Champ obligatoire";
                  }
                },
                onSaved: (value) {

                  // print("Valeur à sauvegarder $value");
                  person.description=value;

                },

                prefixIcon: Icon(Icons.info_outline),

              ),

              SizedBox(height: 15,),

              ListTile(
                title: Text("Date de naissance"),
                subtitle: Text(birthdate != null ? DateFormat('yyyy/MM/dd').format(birthdate!) : 'Non définie'),
                trailing: Icon(Icons.calendar_month),
                onTap: () async {
                  final pickedDate = await showDatePicker(
                      cancelText: "Annuler",
                      confirmText: "Confirmer",
                      barrierColor: Colors.green.shade50,
                      context: context,
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now()
                  );
                  if (pickedDate != null) {
                    birthdate = pickedDate;
                    setState(() {});
                  }
                },
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: IButton(
          onPressed: () {
            if(  _formKey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Inscription réussie'),
                  duration: Duration(seconds: 1),
                ),
              );
              _formKey.currentState!.save();
              Navigator.pop(context, person);
            }
          },
          text: 'Sauvegarder',
        ),
      ),
    );

  }


}
