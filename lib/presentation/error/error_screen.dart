import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/common_components/common_text.dart';

class ErrorScreenV1 extends ConsumerStatefulWidget {
  const ErrorScreenV1({
    super.key,
    required this.error,
    required this.stackTrace,
    this.isDebug = false,
  });

  final bool isDebug;

  final Object error;

  final StackTrace stackTrace;

  @override
  ConsumerState<ErrorScreenV1> createState() => _ErrorScreenV1State();
}

class _ErrorScreenV1State extends ConsumerState<ErrorScreenV1> {
  final List<bool> _isOpen = [true, true];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              width: width * 2 / 3,
              child: const FittedBox(
                child: Text('An error has occurred!'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: ExpansionPanelList(
              children: [
                ExpansionPanel(
                  isExpanded: _isOpen[0],
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return Center(
                      child: Text(
                        'Exception',
                        style: juraTextStyle(fontSize: 25),
                      ),
                    );
                  },
                  body: Container(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      widget.error.toString(),
                    ),
                  ),
                ),
                ExpansionPanel(
                  isExpanded: _isOpen[1],
                  canTapOnHeader: true,
                  headerBuilder: (context, isExpanded) {
                    return Center(
                      child: Text(
                        'StackTrace',
                        style: juraTextStyle(fontSize: 25),
                      ),
                    );
                  },
                  body: Container(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      widget.stackTrace.toString(),
                    ),
                  ),
                ),
              ],
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _isOpen[panelIndex] = !isExpanded;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.color,
  });

  static const path = 'error';
  static const name = path;

  final String text;

  /// Color of icon and text
  final Color color;

  final Color backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: ErrorView(
          text: text,
          color: color,
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.text, this.color});

  final String text;

  /// Color of icon and text
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Icon(
              Icons.error,
              color: color ?? Colors.black,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            text: TextSpan(
              text: text,
              style: juraTextStyle(
                color: color ?? Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
