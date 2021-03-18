import 'package:flutter/material.dart';
import 'package:flutter_github_search_rx_redux/domain/repo_item.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoItemWidget extends StatelessWidget {
  const RepoItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final RepoItem item;

  @override
  Widget build(BuildContext context) {
    final languageColor = item.languageColor;
    final description = item.description;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () async {
        if (await canLaunch(item.htmlUrl)) {
          await launch(item.htmlUrl);
        }
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                width: 96,
                height: 96,
                placeholder: 'assets/icons8-github-96.png',
                image: item.owner.avatar,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  item.fullName,
                  style: textTheme.subtitle1,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                if (description != null)
                  Text(
                    description,
                    style: textTheme.subtitle2!.copyWith(fontSize: 12),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 16),
                if (item.language != null)
                  Row(
                    children: [
                      if (languageColor != null) ...[
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: languageColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        item.language ?? 'Unknown language',
                        style: textTheme.subtitle2,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(item.starCount.toString()),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
