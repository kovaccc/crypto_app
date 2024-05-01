import 'package:crypto_app/core/presentation/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:gap/gap.dart';

class TokenTile extends StatelessWidget {
  final Token token;
  final VoidCallback onTap;

  const TokenTile({super.key, required this.token, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.spacingMedium),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(token.image),
              radius: 25,
            ),
            title: Text(token.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(token.symbol.toUpperCase()),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${token.currentPrice.toStringAsFixed(4)}',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Gap(AppSizes.spacingSmall),
                Text(
                  '${token.priceChangePercentage24h.toStringAsFixed(2)}%',
                  style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                      color: token.priceChangePercentage24h >= 0
                          ? Colors.green
                          : Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
