import 'package:flutter/material.dart';
import 'package:self_bet/core/widgets/app_bars/primary_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double progress = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Добрый день, Матвей. Какая цель на сегодня?',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 192,
                height: 192,
                child: CircularProgressIndicator(
                  value: 1.0,
                  color: Theme.of(context).colorScheme.outline,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),
              ),
              SizedBox(
                width: 192,
                height: 192,
                child: CircularProgressIndicator(
                  value: progress,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Colors.transparent,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${(progress * 100).round()}%',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Container(
                width: 163,
                height: 133,
                decoration: BoxDecoration(
                  color: Color.lerp(
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.onSurface,
                    0.07,
                  )!,
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 24),
                      child: Text(
                        'Воздух',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Свежий',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
