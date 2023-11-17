import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:get/get_utils/get_utils.dart';
import 'package:macos_ui_app/app/constants/colors.dart';
import 'package:macos_ui_app/app/constants/styles.dart';
import 'package:macos_ui_app/app/extensions/context_ext.dart';
import 'package:macos_ui_app/app/extensions/number_ext.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    this.time,
    required this.isSender,
    this.date,
    this.senderName,
    this.isGroupChat = false,
  });

  final String message;
  final String? time, senderName;
  final bool isSender, isGroupChat;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        children: [
          if (date != null && date!.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 6,
              ),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.kContainerBg.withOpacity(0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "$date",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 12),
              ),
            ),
          !isSender
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width / 1.45,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kContainerBg,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isGroupChat &&
                              senderName != null &&
                              senderName!.isNotEmpty)
                            Text(
                              "~ ${senderName ?? ''}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 12,
                                    color: const Color(0xff2a52be),
                                  ),
                            ).paddingOnly(bottom: 8),
                          Text(
                            message,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(),
                          ),
                        ],
                      ),
                    ),
                    if (time != null)
                      Text(
                        time!,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 11),
                      ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: (time != null)
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (time != null)
                      Text(
                        time!,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 11),
                      ),
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width / 1.45),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kBlue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class NoMessageFound extends StatelessWidget {
  const NoMessageFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        12.height,
        Icon(
          Feather.message_square,
          size: 65,
          color: context.primaryColor.withOpacity(0.7),
        ),
        18.height,
        Text(
          "Be the first to send a message",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    ).paddingSymmetric(horizontal: kPadding);
  }
}
