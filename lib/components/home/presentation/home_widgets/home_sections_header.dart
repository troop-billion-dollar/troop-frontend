import 'package:flutter/material.dart';
import 'package:troop/components/auth/presentation/auth.dart';

class HomeSectionHeader extends StatelessWidget {
  HomeSectionHeader({
    Key? key,
    this.headerTitle,
    this.isViewAllVisible = false,
  }) : super(key: key);

  String? headerTitle;
  bool isViewAllVisible;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      color: TroopColors.white.withOpacity(0.2),
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Text(
            headerTitle!,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(
            flex: 1,
          ),
          isViewAllVisible == true
              ? SizedBox(
                  child: Row(
                    children: [
                      Text(
                        "View more ",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(fontSize: 12),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: TroopColors.white,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }
}

/*
SizedBox(
            height: 26,
            width: double.infinity,
            child: Text(
              "Mega Contest",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

 */