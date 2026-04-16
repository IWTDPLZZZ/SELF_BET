import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:self_bet/core/constants/colors.dart';
import 'package:self_bet/core/constants/sizes.dart';
import 'package:self_bet/core/widgets/app_bars/primary_app_bar.dart';
import 'package:self_bet/features/step_tracker/presentation/widgets/dashed_ring_progress.dart';
import 'package:self_bet/features/step_tracker/presentation/widgets/info_card.dart';

String _formatThousands(int value) {
  final s = value.abs().toString();
  final buf = StringBuffer();
  final len = s.length;
  for (var i = 0; i < len; i++) {
    if (i > 0 && (len - i) % 3 == 0) buf.write(',');
    buf.write(s[i]);
  }
  return buf.toString();
}

BoxDecoration _elevatedCardDecoration(Color bg) {
  return BoxDecoration(
    color: bg,
    borderRadius: BorderRadius.circular(AppSizes.cardRadius),
    boxShadow: [
      BoxShadow(
        color: AppColors.onSurface.withValues(alpha: 0.06),
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ],
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double progress = 0.5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const PrimaryAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final contentWidth =
              constraints.maxWidth - AppSizes.horizontalPadding * 2;
          final heroSide = math.min(contentWidth, 320.0);
          final ringSize = heroSide * 0.74;

          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSizes.horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    'Добрый день, Матвей. Какая цель на сегодня?',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: AppSizes.sectionGap + 4),
                  Center(
                    child: SizedBox(
                      width: heroSide,
                      height: heroSide,
                      child: DecoratedBox(
                        decoration:
                            _elevatedCardDecoration(AppColors.surfaceWhite),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DashedRingProgress(
                              size: ringSize,
                              progress: progress,
                              trackColor: theme.colorScheme.outline
                                  .withValues(alpha: 0.45),
                              progressColor: theme.colorScheme.primary,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _formatThousands(6400),
                                  style: theme.textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'ШАГОВ',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    letterSpacing: 1.1,
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.onSurface
                                        .withValues(alpha: 0.55),
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: AppSizes.cardPadding,
                              right: AppSizes.cardPadding,
                              bottom: 18,
                              child: Text(
                                'Изменить цель',
                                style: theme.textTheme.labelSmall,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.sectionGap),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InfoCard(
                          height: AppSizes.metricTileHeight,
                          decoration: _elevatedCardDecoration(AppColors.surfaceWhite),
                          title: 'ВОЗДУХ',
                          subtitle: 'Свежий',
                          subtitleTrailing: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          detail: '420 ppm • Идеально для работы',
                          theme: theme,
                        ),
                      ),
                      const SizedBox(width: AppSizes.rowGap),
                      Expanded(
                        child: InfoCard(
                          height: AppSizes.metricTileHeight,
                          decoration: _elevatedCardDecoration(AppColors.surface),
                          title: 'СВЕТ',
                          subtitle: '12:30 ч',
                          detail: 'Витамин D',
                          detailTrailing: Padding(
                            padding: const EdgeInsets.only(left: 6, top: 2),
                            child: Icon(
                              Icons.wb_sunny_rounded,
                              size: 20,
                              color: Colors.amber.shade700,
                            ),
                          ),
                          theme: theme,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.sectionGap),
                  _DigitalBalanceCard(theme: theme),
                  const SizedBox(height: AppSizes.sectionGap),
                  _DailyTasksCard(theme: theme),
                  const SizedBox(height: AppSizes.sectionGap + 4),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withValues(alpha: 0.28),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              'Начать день',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: AppColors.onPrimaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DigitalBalanceCard extends StatelessWidget {
  const _DigitalBalanceCard({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Цифровой баланс',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.onSurfaceContainer,
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceWhite,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Text(
                      '2ч 15м',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: const [
                Expanded(
                  child: _BalanceIconTile(
                    icon: Icons.chat_bubble_outline_rounded,
                    label: 'Мессенджеры',
                  ),
                ),
                Expanded(
                  child: _BalanceIconTile(
                    icon: Icons.mail_outline_rounded,
                    label: 'Почта',
                  ),
                ),
                Expanded(
                  child: _BalanceIconTile(
                    icon: Icons.share_outlined,
                    label: 'Соцсети',
                  ),
                ),
                Expanded(
                  child: _BalanceIconTile(
                    icon: Icons.public_rounded,
                    label: 'Браузер',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BalanceIconTile extends StatelessWidget {
  const _BalanceIconTile({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.surfaceWhite,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SizedBox(
              width: 52,
              height: 52,
              child: Icon(
                icon,
                size: 24,
                color: AppColors.onSurface.withValues(alpha: 0.78),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.labelSmall?.copyWith(
              height: 1.15,
              color: AppColors.onSurface.withValues(alpha: 0.72),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _DailyTasksCard extends StatelessWidget {
  const _DailyTasksCard({required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _elevatedCardDecoration(AppColors.surface),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Задачи на день',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  '3 из 5',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const _TaskRow(
              done: true,
              title: 'Утренняя медитация',
            ),
            const SizedBox(height: 12),
            const _TaskRow(
              done: false,
              title: 'Прогулка в парке 20 мин',
            ),
            const SizedBox(height: 12),
            const _TaskRow(
              done: true,
              title: 'Чтение книги',
            ),
          ],
        ),
      ),
    );
  }
}

class _TaskRow extends StatelessWidget {
  const _TaskRow({
    required this.done,
    required this.title,
  });

  final bool done;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: done ? AppColors.primaryColor : Colors.transparent,
            border: Border.all(
              color: done
                  ? AppColors.primaryColor
                  : theme.colorScheme.outline.withValues(alpha: 0.55),
              width: 2,
            ),
          ),
          child: done
              ? const Icon(Icons.check, size: 16, color: AppColors.onPrimaryColor)
              : null,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              decoration: done ? TextDecoration.lineThrough : null,
              decorationColor:
                  theme.colorScheme.onSurface.withValues(alpha: 0.45),
              color: done
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.45)
                  : theme.colorScheme.onSurface,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}
