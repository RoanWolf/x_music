import 'package:flutter/material.dart';
import '../../core/theme/app_pallete.dart';
import 'view/widgets/custom_title.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Hei Deng',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Pallete.whiteColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Pallete.whiteColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Pallete.whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 个性化推荐横幅
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF667eea),
                    Color(0xFF764ba2),
                    Color(0xFFf093fb),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const NetworkImage(
                          'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // 横幅内容
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '个性化推荐',
                          style: TextStyle(
                            fontSize: 16,
                            color: Pallete.subtitleText,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '根据你的音乐品味',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Pallete.whiteColor,
                          ),
                        ),
                        Text(
                          '为你精选',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Pallete.whiteColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 推荐歌单标题
            CustomTitle(
              title: '推荐歌单',
              onTap: () {
                print('推荐歌单查看更多被点击');
              },
            ),
            const SizedBox(height: 15),

            // 推荐歌单网格
            _buildPlaylistGrid(context),

            const SizedBox(height: 20),

            // 最新音乐标题
            CustomTitle(
              title: '最新音乐',
              onTap: () {
                print('最新音乐查看更多被点击');
              },
            ),

            const SizedBox(height: 15),

            // 最新音乐列表
            _buildNewMusicList(context),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // 推荐歌单网格
  Widget _buildPlaylistGrid(BuildContext context) {
    final List<Map<String, String>> playlists = [
      {
        'title': '每日推荐',
        'subtitle': '根据你的喜好智能推荐',
        'image':
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': '热门榜单',
        'subtitle': '全网最热歌曲排行',
        'image':
            'https://images.unsplash.com/photo-1485579149621-3123dd979885?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': '私人FM',
        'subtitle': '只属于你的音乐频道',
        'image':
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80',
      },
      {
        'title': '新歌速递',
        'subtitle': '最新发布的好音乐',
        'image':
            'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&q=80',
      },
    ];

    return SizedBox(
      height: 250,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 25),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1.5,
        ),
        itemCount: playlists.length,
        itemBuilder: (context, index) {
          final playlist = playlists[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(playlist['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    playlist['title']!,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    playlist['subtitle']!,
                    style: TextStyle(fontSize: 11, color: Pallete.subtitleText),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // 最新音乐列表
  Widget _buildNewMusicList(BuildContext context) {
    final List<Map<String, String>> newSongs = [
      {
        'title': '夜曲',
        'artist': '周杰伦',
        'album': '十一月的萧邦',
        'image':
            'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80',
      },
      {
        'title': '青花瓷',
        'artist': '周杰伦',
        'album': '我很忙',
        'image':
            'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80',
      },
      {
        'title': '稻香',
        'artist': '周杰伦',
        'album': '魔杰座',
        'image':
            'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80',
      },
      {
        'title': '七里香',
        'artist': '周杰伦',
        'album': '七里香',
        'image':
            'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixlib=rb-4.0.3&auto=format&fit=crop&w=100&q=80',
      },
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: newSongs.length,
        itemBuilder: (context, index) {
          final song = newSongs[index];
          return Container(
            width: 150,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(song['image']!),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    song['title']!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    song['artist']!,
                    style: TextStyle(fontSize: 12, color: Pallete.subtitleText),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.play_circle_filled,
                        color: Pallete.greenColor,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '播放',
                        style: TextStyle(
                          fontSize: 14,
                          color: Pallete.greenColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
