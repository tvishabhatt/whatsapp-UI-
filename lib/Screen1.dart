import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Screen2.dart';

import 'main.dart';

class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Screen1State();
  }
}

late TabController _controller;

class Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  bool b = true;
  int index = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final provider = Provider.of<tab>(context);
    return Scaffold(
        backgroundColor: Color(0xff121b23),
        body: CustomScrollView(
          slivers: <Widget>[
            Consumer(builder: (context, tab, child) {
              return SliverAppBar(
                pinned: provider.i == 1 ? false : true,
                elevation: 0,
                snap: false,
                floating: true,
                leading: SizedBox(),
                leadingWidth: 0,
                flexibleSpace: const FlexibleSpaceBar(),
                backgroundColor: Color(0xff1F2C35),
                title: Text(
                  'WhatsApp',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        print(provider.i);
                      },
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 25,
                        color: Colors.grey,
                      )),
                  if (provider.i == 1 || provider.i == 3) ...{
                    IconButton(
                        onPressed: () {
                          print(provider.i);
                        },
                        icon: Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.grey,
                        )),
                  },
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Screen2(),
                        ));
                      },
                      icon: Icon(
                        Icons.more_vert,
                        size: 25,
                        color: Colors.grey,
                      )),
                ],
              );
            }),
            SliverAppBar(
                pinned: true,
                elevation: 0,
                floating: false,
                backgroundColor: Color(0xff1F2C35),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: Consumer(builder: (context, tab, child) {
                    return TabBar(
                        onTap: (value) {
                          provider.bcd(value);
                        },
                        controller: _controller,
                        indicatorColor: Color(0xff00A784),
                        labelColor: Color(0xff00A784),
                        unselectedLabelColor: Colors.grey,
                        labelPadding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        isScrollable: true,
                        labelStyle: TextStyle(fontSize: 18),
                        tabs: [
                          Container(
                              width: MediaQuery.of(context).size.width / 10,
                              child: Tab(
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Icon(
                                    Icons.groups,
                                    size: 30,
                                  ),
                                ),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              child: Tab(
                                text: "Chats",
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              child: Tab(
                                text: "Updats",
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width / 3.3,
                              child: Tab(
                                text: 'Calls',
                              ))
                        ]);
                  }),
                )),
            SliverFillRemaining(
                child: TabBarView(controller: _controller, children: [
              Scaffold(
                backgroundColor: Color(0xff121b23),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/chat_what.png')),
                    Center(
                        child: Text(
                      'Stay connected with a community',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    )),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                          child: Text(
                        "Communities bring members together in topic-based groups, and make it easy to get admin announcements.Any community you're added to will apper hear.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        'See example communites >',
                        style: TextStyle(
                            color: Color(0xff00A784),
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff00A784),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 10, bottom: 10),
                            child: Text(
                              'Start  Your communite',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Scaffold(
                backgroundColor: Color(0xff121b23),
                body: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: data[index]['Ima'],
                      ),
                      subtitle: data[index]['sub'],
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[index]['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            data[index]['time'],
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(0xff00A784),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Icon(
                      Icons.message_rounded,
                      color: Colors.black,
                      size: 20,
                    )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              Scaffold(
                  backgroundColor: Color(0xff121b23),
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer(builder: (context, value, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Status',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.more_vert,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        height: 70,
                                        width: 80,
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 33,
                                              backgroundColor:
                                                  Colors.grey.shade600,
                                              child: Center(
                                                  child: Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                                size: 30,
                                              )),
                                            ),
                                            Positioned(
                                                top: 45,
                                                left: 30,
                                                child: SizedBox(
                                                  height: 24,
                                                  child: FloatingActionButton
                                                      .small(
                                                    backgroundColor:
                                                        Color(0xff00A784),
                                                    onPressed: () {},
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 10,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        'My Status',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                fun(0),
                                fun(4),
                                fun(6),
                                fun(8),
                                fun(9),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 8, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Channels',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  size: 25,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(
                                  'assets/Img 7.jpg',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Katrina Kaif',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.photo,
                                        size: 15,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        'All❤️for all 15M of You!!',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Yesterday',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image: AssetImage('assets/Img 7.jpg'),
                                      fit: BoxFit.fill,
                                      repeat: ImageRepeat.noRepeat),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 8, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Find channels',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'See all >',
                                style: TextStyle(
                                  color: Color(0xff00A784),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                fun2('Akshay Kumar', 'assets/Img 7.jpg'),
                                fun2('Indian Cricket Team', 'assets/Img 7.jpg'),
                                fun2('Diljit Dosanjh', 'assets/Img 7.jpg'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(top: 510),
                    child: Container(
                      height: 130,
                      child: Column(
                        children: [
                          FloatingActionButton.small(
                            onPressed: () {},
                            backgroundColor: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              )),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Color(0xff00A784),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.black,
                                  size: 20,
                                )),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Scaffold(
                backgroundColor: Color(0xff121b23),
                body: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Color(0xff00A784),
                              child: Center(
                                  child: Transform.rotate(
                                      angle: 4.0,
                                      child: Icon(
                                        Icons.link,
                                        color: Colors.black,
                                        size: 30,
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Creat call link',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    'Share a link for your WhatsApp call',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Recent',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              con(),
                              con1(),
                              con(),
                              con(),
                              con(),
                              con(),
                              con1(),
                              con(),
                              con(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Color(0xff00A784),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Icon(
                      Icons.add_call,
                      color: Colors.black,
                      size: 20,
                    )),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),

            ]))
          ],
        ));
  }

  Widget fun(int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff00A784),
                ),
                color: Color(0xff111B22),
                shape: BoxShape.circle),
            child: Center(
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/Img 7.jpg"),
                      fit: BoxFit.fill,
                      repeat: ImageRepeat.noRepeat),
                ),
              ),
            ),
          ),
          Text(
            data[1]['name'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget fun2(String a, String b) {
    return Padding(
        padding: const EdgeInsets.only(right: 20, top: 20, left: 1, bottom: 1),
        child: Container(
          height: 170,
          width: 140,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: 70,
                      width: 80,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 33,
                            backgroundColor: Colors.grey.shade600,
                            backgroundImage: AssetImage(b),
                          ),
                          Positioned(
                              top: 45,
                              left: 34,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  'assets/logo (1).png',
                                  fit: BoxFit.cover,
                                  repeat: ImageRepeat.noRepeat,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    a,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    child: Center(
                      child: Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xff111B22),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
              width: 2,
              style: BorderStyle.solid,
              strokeAlign: 1,
            ),
          ),
        ));
  }

  Widget con() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: data[1]['Ima'],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[1]['name'],
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.north_east,
                              color: Colors.green,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                'Yesterday , 20:08',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget con1() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: data[2]['Ima'],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[2]['name'],
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.south_west,
                              color: Colors.red,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                'Yesterday , 10:30',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.green,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class tab extends ChangeNotifier {
  int i = 1;
  void bcd(int m) {
    i = m;
    print(i);
    notifyListeners();
  }
}
