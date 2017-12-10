<img src="https://cdn-images-1.medium.com/max/1600/1*OZNZMNqqJYqH-LpNFYKI3w.png" style="zoom:80%" />

# Core ML and Machine Vision in iOS 11

[![DUB](https://img.shields.io/badge/download-89M-blue.svg)](https://github.com/Wanguy/Core-ML-and-Inception-v3/releases/download/1.0/MLTest.zip) [![Travis](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/Wanguy/Core-ML-and-Inception-v3/blob/master/LICENSE) [![Travis](https://img.shields.io/badge/LICENSE-GPLv3-brightgreen.svg)](https://github.com/Wanguy/Core-ML-and-Inception-v3/blob/master/LICENSE) [![Twitter URL](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/rp_Wang) 

## Introduction

It has arrived. With iOS 11, Apple finally introduced a native machine learning
and machine vision framework. This opens up a whole host of new possibilities,
promising great leaps forward in apps and games of all natures.

![](https://github.com/Wanguy/Core-ML-and-Inception-v3/blob/master/Img/Screen%20Shot%202017-12-10%20at%2019.10.01.png)

Machine learning solutions have been available for a while in the cloud, but
these systems require a constant internet connection and oftentimes have a very
noticiable delay on iOS for obvious reasons. This also creates a security risk
for sensitive data. Some third-party  Swift AI systems have begun to take hold
inside of a select few apps, but such frameworks never hit the mainstream
development community. With Apple’s new introduction at the 2017 WWDC it is
likely that many of your favorite apps will see signifigant
machine-learning-related updates.

You can find it in [here](https://developer.apple.com/videos/wwdc2017/) if you are interested in seeing how you can integrate Apple’s new APIs into your very own apps. 

It’s easier than you think!

![](https://cdn-images-1.medium.com/max/1600/1*fI3VsBMqXglx0S0tU6R1tg.png)

## Requirements

- Xcode 9
- Swift 4
- iOS 11

## Setup

To run this project, you need a pre-trained model. I have put a model in this project and it is one of the best as reference accuracy and size of the model. However, you can choose another model in [here](https://developer.apple.com/machine-learning/) what you want.

![](https://cdn-images-1.medium.com/max/1600/1*6agZ1CcGVwiOaX3gNP8cYw.png)

**Clone it with:**

```
git clone git@github.com:Wanguy/Core-ML-and-Inception-v3.git
cd Core-ML-and-Inception-v3
```

**or manually [download](https://github.com/Wanguy/Core-ML-and-Inception-v3/releases/tag/1.0).**

### Tutorial

[You can check wiki in here](https://github.com/Wanguy/Core-ML-and-Inception-v3/wiki/Tutorial:-Create-classification).

## Interface

![Interface](https://github.com/Wanguy/Core-ML-and-Inception-v3/blob/master/Img/Core%20ML.png)

 <img src="https://github.com/Wanguy/Core-ML-and-Inception-v3/blob/master/Img/Screen%20Shot%202017-12-10%20at%2018.21.35.png" width = "300" height = "200" alt="img" align=center />

## Link

- [Awesome Core ML Models](https://github.com/likedan/Awesome-CoreML-Models/)
- [Welcoming Core ML](https://medium.com/towards-data-science/welcoming-core-ml-8ba325227a28)
- [Integrating a Core ML Model into Your App](https://developer.apple.com/documentation/coreml/integrating_a_core_ml_model_into_your_app%5D)

## License

Copyright (c) 2015-2017 Wanguy. Released under GPLv3. See [LICENSE](https://github.com/Wanguy/Core-ML-and-Inception-v3/blob/master/LICENSE) for details.

