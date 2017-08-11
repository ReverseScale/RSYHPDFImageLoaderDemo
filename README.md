# RSYHPDFImageLoaderDemo
PDF 素材 加载工具 YHPDFImageLoader Demo，支持缓存和无锯齿展示PDF文件。

![](https://img.shields.io/badge/platform-iOS-red.svg) 
![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/download-2.6MB-brightgreen.svg)
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

自从 Xcode 6 以后图片素材支持 PDF 矢量图，从此苹果开发进入了无锯齿化时代，虽然现在尚未普及，但是矢量图带来的好处，不言而喻。

| 名称 |1.列表页 |2.展示页 |
| ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-11/44299749.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-8-11/77545639.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 展示 PDF 素材 |


## Advantage 框架的优势
* 1.文件少，代码简洁
* 2.不依赖任何其他第三方库
* 3.支持本地缓存，提高加载速度
* 4.具备较高自定义性

## Installation 安装
### 1.手动安装:
`下载Demo后,将功能文件夹拖入到项目中, 导入头文件后开始使用。`
### 2.CocoaPods安装:
修改“Podfile”文件
```
pod 'YHPDFImageLoader', '~> 1.0.0'
```
控制台执行 Pods 安装命令 （ 简化安装：pod install --no-repo-update ）
```
pod install
```
> 如果 pod search 发现不是最新版本，在终端执行pod setup命令更新本地spec镜像缓存，重新搜索就OK了

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 第一步 引入头文件
```
#import "UIImage+YHPDFIcon.h"
```
### 第二步 简单调用
```
image = [UIImage yh_imageWithPDFFileNamed:pdfName expectSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
```

## Optimize 优化
### 1.APP 瘦身
我们对比一下最近设计部门的朋友刚导出的某个图标的一套常规的 PNG 图片和 PDF 类型的图片的大小：
![](http://og1yl0w9z.bkt.clouddn.com/17-8-11/59023751.jpg)
PDF 文件大小为 7KB
PNG 三个文件合计大小为 85KB
对比结果: PDF 类型的文件大概占空间为传统 PNG 类型的 8%（以当前资源为依据，不同资源对比结果可能会有部分出入）。

### 2.便于维护

首先就是设计部门出图就会比之前方便很多，直接导出矢量文件即可，并且如果后期再需要 4X、5X… 规格的图，不需要对之前的图标再返工处理。
再者作为开发者在管理图片相关的添加、替换、移除等重复性的操作维护压力可以降低。

### 3.可以无限放大

由于 PDF 图标文件为矢量图，不同于之前的传统的位图，在放大之后可以依然保持清晰而非模糊毛边有像素颗粒感。

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSYHPDFImageLoaderDemo 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
