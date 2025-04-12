import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                _ContainerImage(),
                Positioned(
                  top: 100,
                  child: IconButton(onPressed: () {
                    
                  }, icon: Icon(Icons.chevron_left, size: 60, color: Colors.white,)),
                )
              ],
            ),
            _TextDescription(),
            _PriceDescription(),
            _ColorsReferences(),
            _ButtonsContainer(),
          ],
        ),
      ),
    );
  }
}

class _ContainerImage extends StatelessWidget {
  const _ContainerImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 450,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xFFFFD54F),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/azul.png', height: 300),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _TextDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Nike Air Max 720',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              style: TextStyle(fontSize: 17, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          // color: Color(0x3C9E9E9E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$ 180.0',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFFF9e00)),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                ),
              ),
              child: const Text(
                'Buy now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}

class _ColorsReferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          // color: Color(0x3C9E9E9E),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 85,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFCCDD3D),
                        borderRadius: BorderRadius.circular(40)
                      ),
                    ),
                  ),
                  Positioned(
                    left: 55,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF9e00),
                        borderRadius: BorderRadius.circular(40)
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFF3AA8F7),
                        borderRadius: BorderRadius.circular(40)
                      ),
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFF435560),
                      borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xFFFFCA86)),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                ),
              ),
              child: const Text(
                'More related item',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      
      ),
    );
  }
}


class _ButtonsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.favorite), color: Colors.red,
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(15),
                ),
              )),
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.shopping_cart), style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(15),
                ),
              )),
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.settings), style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.green),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.all(15),
                ),
              )),
          ],
        ),
      
      ),
    );
  }
}
