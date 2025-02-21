import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class MySwiper extends StatelessWidget {
  final List<Map<String, dynamic>> banners = [
    {
      "title": '撒娇发多少',
      "url":
          'https://img2.baidu.com/it/u=1537050446,1283638930&fm=253&fmt=auto&app=120&f=JPEG?w=607&h=404'
    },
    {
      "title": '和覅额无人合',
      "url":
          'https://img0.baidu.com/it/u=1012502209,2247218981&fm=253&fmt=auto&app=120&f=JPEG?w=1014&h=500'
    }
  ];
  DotSwiperPaginationBuilder builder = new DotSwiperPaginationBuilder(
    activeColor: Color(0xffffc81f),
    space: 5.0,
    size: 7.0
  );
  MySwiper({super.key});

  @override
  Widget build(BuildContext context) {
    if (banners.length == 0) {
      return Container();
    }
    return Container(
      height: 200,
      child: Swiper(
          autoplay: true,
          itemCount: banners.length,
          pagination: SwiperPagination(
            builder: builder,
          ),
          itemBuilder: (BuildContext context, int index) {
            if (banners[index] is Map && banners[index].containsKey('url')) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(banners[index]['url']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Container(
                          color: Color.fromARGB(50, 0, 0, 0),
                        )),
                    Positioned(
                      child: Text(
                        banners[index]['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      bottom: 10,
                    ),
                  ],
                ),
              );
            } else {
              return Text('Error: Invalid banner data');
            }
          }),
    );
  }
}
