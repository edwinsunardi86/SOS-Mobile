import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_style/API/api_cities.dart';
import 'component/custom_button.dart';
import 'package:text_style/component/sidebar.dart';
import 'package:text_style/component/input_text.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class RegistrationApply extends StatefulWidget {
  const RegistrationApply({Key? key}) : super(key: key);

  @override
  State<RegistrationApply> createState() => _RegistrationApplyState();
}

class Animal {
  final int? id;
  final String? name;

  Animal({
    this.id,
    this.name,
  });
}

class _RegistrationApplyState extends State<RegistrationApply> {
  static final List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name!))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String? dropdownGender;
  String? dropdownKota;
  String? lastEducation;
  String? dropdownJobBefore;
  bool isCheckedYes = false;
  bool isCheckedNo = false;
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    TextEditingController fullname = TextEditingController();
    TextEditingController dateTime = TextEditingController();
    TextEditingController heightBody = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController alamat = TextEditingController();
    TextEditingController jobInterest = TextEditingController();
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: const Sidebar(),
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      repeat: ImageRepeat.repeat,
                      image:
                          AssetImage("assets/images/background/red_grad.png"))),
              child: Column(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                            width: 60,
                            image: AssetImage("assets/images/icons/karir.png")),
                        Text(
                          "Karir",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    const Text(
                      "Mencari Kerja Untuk Pekerja",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Form(
                        key: _formKey,
                        child: Column(children: [
                          const Padding(
                            padding: EdgeInsets.all(20),
                            child: Text("Formulir Data",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Nama Lengkap",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          InputTextFormValidatorV2(
                              controller: fullname,
                              label: "Nama Lengkap",
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.black26,
                              ),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Please input your full name";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "No. HP / WA",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          InputTextFormValidatorV2(
                              controller: fullname,
                              label: "No. HP / WA",
                              icon: const Icon(
                                Icons.contact_phone,
                                color: Colors.black26,
                              ),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Please input your full name";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Tanggal Lahir",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          InputDatePicker(
                            controller: dateTime,
                            label: "Tanggal Lahir",
                            icon: const Icon(Icons.calendar_month),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Jenis Kelamin",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton<String>(
                                value: dropdownGender,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 5,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownGender = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Laki-laki',
                                  'Perempuan'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Tinggi",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          InputTextFormValidatorV2(
                              controller: heightBody,
                              label: "Tinggi",
                              icon: const Icon(
                                Icons.man,
                                color: Colors.black26,
                              ),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Please input your height";
                                } else {
                                  return null;
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Email",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          InputTextFormValidatorV2(
                              inputFormatter: r'[\s]',
                              controller: email,
                              label: "Email",
                              icon: const Icon(
                                Icons.email,
                                color: Colors.black26,
                              ),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Please input email!";
                                } else {
                                  RegExp regex = RegExp(
                                      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                                  if (regex.hasMatch(value)) {
                                    return null;
                                  } else {
                                    return 'You have entered an invalid email address!';
                                  }
                                }
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Alamat saat ini",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          InputTextFormArea(
                            controller: alamat,
                            label: "Alamat",
                            icon: const Icon(
                              Icons.home,
                              color: Colors.black26,
                            ),
                            maxLines: 4,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Kota",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton<String>(
                                value: dropdownKota,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownKota = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Cibinong',
                                  'Jakarta'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Pengalaman",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isCheckedYes,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheckedYes = value!;
                                      isCheckedNo = false;
                                    });
                                  },
                                ),
                                Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isCheckedNo,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isCheckedNo = value!;
                                        isCheckedYes = false;
                                      });
                                    }),
                              ])),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Pekerjaan Sebelumnya",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton<String>(
                                value: dropdownJobBefore,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 5,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownJobBefore = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Menanam Singkong',
                                  'Pijat Refleksi'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Pekerjaan yang diminati",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          InputTextFormArea(
                            controller: jobInterest,
                            label: "Pekerjaan yang diminati",
                            icon: const Icon(
                              Icons.cases_rounded,
                              color: Colors.black26,
                            ),
                            maxLines: 4,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Row(
                          //   children: const [
                          //     Align(
                          //       alignment: Alignment.centerLeft,
                          //       child: Text(
                          //         "Pekerjaan yang diminati",
                          //         textAlign: TextAlign.left,
                          //         style: TextStyle(fontSize: 17),
                          //       ),
                          //     ),
                          //     Text(
                          //       "(wajib diisi)",
                          //       style:
                          //           TextStyle(color: Colors.red, fontSize: 12),
                          //     )
                          //   ],
                          // ),
                          // InputTextFormValidatorV2(
                          //     controller: jobInterest,
                          //     label: "Lokasi kerja yang diminati",
                          //     icon: const Icon(
                          //       Icons.account_circle,
                          //       color: Colors.black26,
                          //     ),
                          //     validators: (value) {
                          //       if (value!.isEmpty) {
                          //         return "Please input your location job interest";
                          //       } else {
                          //         return null;
                          //       }
                          //     }),
                          Material(
                            elevation: 5,
                            child: Container(
                              child: MultiSelectDialogField(
                                items: _items,
                                title: Text("Animals"),
                                selectedColor: Colors.black26,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                buttonIcon: Icon(
                                  Icons.pets,
                                  color: Colors.black26,
                                ),
                                buttonText: Text(
                                  "Favorite Animals",
                                  style: TextStyle(
                                    color: Colors.white24,
                                    fontSize: 16,
                                  ),
                                ),
                                onConfirm: (results) {
                                  //_selectedAnimals = results;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: const [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Pendidikan terakhir",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Text(
                                "(wajib diisi)",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )
                            ],
                          ),
                          FutureBuilder(
                            future: ApiCities.fetchCities(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<ApiCities>> snapshot) {},
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            elevation: 5,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButton<String>(
                                value: lastEducation,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 5,
                                style: const TextStyle(color: Colors.grey),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    lastEducation = newValue!;
                                  });
                                },
                                items: <String>[
                                  'TK',
                                  'SD'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const CustomButtonGradientIconClass(
                            inputText: "Submit",
                            fontFamily: "Roboto",
                            iconClass: Icons.arrow_circle_right,
                          )
                        ])))
              ])),
        ));
  }
}
