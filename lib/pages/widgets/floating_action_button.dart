import 'package:dicoding_restaurant_app/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('let\'s chat me now')));
              },
              icon: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Share with friends'),
                  ),
                );
              },
              icon: SvgPicture.asset('assets/icons/share.svg'),
            ),
          ),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('let\'s booking now')));
              },
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
              child: const Text(
                'Booking Now',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
