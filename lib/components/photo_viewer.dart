// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewer extends StatefulWidget {
  const PhotoViewer({ Key key, this.pics, this.initialIndex, this.headers, this.backgroundDecoration }) : super(key: key);

  final List<String> pics;
  final int initialIndex;
  final Map<String, String> headers;
  final Decoration backgroundDecoration;

  @override
  PhotoViewerState createState() => PhotoViewerState();
}

class PhotoViewerState extends State<PhotoViewer> with SingleTickerProviderStateMixin {
  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.chevron_left),
            color: Theme.of(context).primaryColor,
          ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage( widget.pics[index],headers: widget.headers),
                  minScale: PhotoViewComputedScale.contained * 0.7,
                  initialScale: PhotoViewComputedScale.contained * 0.95,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.pics[index]),
                );
              },
              itemCount: widget.pics.length,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: PageController(initialPage: widget.initialIndex),
              onPageChanged: onPageChanged,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "${currentIndex + 1} / ${widget.pics.length}",
                style: const TextStyle(
                    color: Colors.white, fontSize: 17.0, decoration: null),
              ),
            )
          ],
        ),
      ),
    );
  }
}
