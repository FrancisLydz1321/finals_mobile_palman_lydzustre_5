import 'package:finals_mobile_palman_lydzustre_5/constants/themes.dart';
import 'package:flutter/material.dart';

class AdsBannerWidget extends StatelessWidget {
  const AdsBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Apple Store',
                    style: AppTheme.kBigTitle,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Find other product in our store askdjhaldalsdhagsdjhagsdkjhagsdasd',
                    style: AppTheme.kBodyText.copyWith(color: kWhiteColor),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kWhiteColor,
                          foregroundColor: kSecondaryColor),
                      onPressed: () {},
                      child: Text(
                        'SHOP NOW!',
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: kdefaultColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
