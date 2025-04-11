import 'package:animate_do/animate_do.dart';
import 'package:disenos_app/widgets/shared/buttons/button_icon_item_widget.dart';
import 'package:disenos_app/widgets/shared/headers/icon_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemButton {
  final String text;
  final IconData icon;
  final Color gradientPrimary;
  final Color gradientSecondary;

  ItemButton({required this.text, required this.icon, required this.gradientPrimary, required this.gradientSecondary});
}
class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<ItemButton> items = [
      ItemButton(text: 'Motor Accident', icon: FontAwesomeIcons.carBurst, gradientPrimary: const Color(0xff6989F5), gradientSecondary: const Color(0xff906EF5)),
      ItemButton(text: 'Medical Emergency', icon: FontAwesomeIcons.plus, gradientPrimary: const Color(0xff66A9F2), gradientSecondary: const Color(0xff536CF6)),
      ItemButton(text: 'Theft / Harrasement', icon: FontAwesomeIcons.faceSmile, gradientPrimary: const Color(0xffF2D572), gradientSecondary: const Color(0xffE06AA3)),
      ItemButton(text: 'Awards', icon: FontAwesomeIcons.personBiking, gradientPrimary: const Color(0xff317183), gradientSecondary: const Color(0xff46997D)),
      ItemButton(text: 'Motor Accident', icon: FontAwesomeIcons.masksTheater, gradientPrimary: const Color(0xff6989F5), gradientSecondary: const Color(0xff906EF5)),
      ItemButton(text: 'Medical Emergency', icon: FontAwesomeIcons.motorcycle, gradientPrimary: const  Color(0xff66A9F2), gradientSecondary: const  Color(0xff536CF6)),
      ItemButton(text: 'Theft / Harrasement', icon: FontAwesomeIcons.truck, gradientPrimary: const Color(0xffF2D572), gradientSecondary: const Color(0xffE06AA3)),
      ItemButton(text: 'Awards', icon: FontAwesomeIcons.mosquito, gradientPrimary: const Color(0xff317183), gradientSecondary: const Color(0xff46997D)),
      ItemButton(text: 'iamges', icon: FontAwesomeIcons.image, gradientPrimary: const Color(0xff6989F5), gradientSecondary: const Color(0xff906EF5)),
      ItemButton(text: 'Motor Accident', icon: FontAwesomeIcons.carBurst, gradientPrimary: const Color(0xff6989F5), gradientSecondary: const Color(0xff906EF5)),
      ItemButton(text: 'Medical Emergency', icon: FontAwesomeIcons.plus, gradientPrimary: const Color(0xff66A9F2), gradientSecondary: const Color(0xff536CF6)),
      ItemButton(text: 'Theft / Harrasement', icon: FontAwesomeIcons.faceSmile, gradientPrimary: const Color(0xffF2D572), gradientSecondary: const Color(0xffE06AA3)),
      ItemButton(text: 'Awards', icon: FontAwesomeIcons.personBiking, gradientPrimary: const Color(0xff317183), gradientSecondary: const Color(0xff46997D)),
      ItemButton(text: 'Motor Accident', icon: FontAwesomeIcons.masksTheater, gradientPrimary: const Color(0xff6989F5), gradientSecondary: const Color(0xff906EF5)),
      ItemButton(text: 'Medical Emergency', icon: FontAwesomeIcons.motorcycle, gradientPrimary: const  Color(0xff66A9F2), gradientSecondary: const  Color(0xff536CF6)),
      ItemButton(text: 'Theft / Harrasement', icon: FontAwesomeIcons.truck, gradientPrimary: const Color(0xffF2D572), gradientSecondary: const Color(0xffE06AA3)),
      ItemButton(text: 'Awards', icon: FontAwesomeIcons.mosquito, gradientPrimary: const Color(0xff317183), gradientSecondary: const Color(0xff46997D)),
      ItemButton(text: 'iamges', icon: FontAwesomeIcons.image, gradientPrimary: const Color(0xff6989F5), gradientSecondary: const Color(0xff906EF5)),
    ]; 

    final List<Widget> buttonIconItemWidget = items.map((item) => FadeInLeft(
      child: ButtonIconItemWidget(
        text: item.text, icon: item.icon, gradientPrimary: item.gradientPrimary, gradientSecondary: item.gradientSecondary, onTap: () {},
        ),
    ),).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 70,),
                ...buttonIconItemWidget
              ],
            ),
          ),
          const _Header(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHaderWidget(
          title: 'Haz solitado',
          subTitle: 'Asistencia Médica',
          icon: FontAwesomeIcons.plus,
        ),
        Positioned(
          right: 0,
          top: 40,
          child: MaterialButton(
            onPressed: () {
            
          },
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
          child: const FaIcon(FontAwesomeIcons.ellipsisVertical, color: Colors.white,),),
        )
      ],
    );
  }
}
