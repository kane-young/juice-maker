# ๐ฅค ์ฅฌ์ค ๋ฉ์ด์ปค ํ๋ก์ ํธ

(with [yun)](https://github.com/blanche37)

๐ ๊ณผ์  ์งํ ๊ธฐ๊ฐ : 2021-03-08 ~ 2021-03-19

<br>

## 1. Overview

๊ณผ์ผ์ ์ฌ๊ณ ๋ฅผ ํ์ํ๊ณ , ์ฅฌ์ค๋ฅผ ์์ฑํ  ์ ์์ต๋๋ค

์ฌ๊ณ  ๋ถ์กฑ์์๋ ์ฌ๊ณ ๋ฅผ ์กฐ์ ํ๋ ์ธํฐํ์ด์ค๊ฐ ์๋ ์ ํ๋ฆฌ์ผ์ด์์๋๋ค

ํด๋น ์ ํ๋ฆฌ์ผ์ด์์ **iPhone - ๊ฐ๋ก ์ ์ฉ ๋ชจ๋** ๋ง์ ์ง์ํฉ๋๋ค

<br>

### MVC

๋ณต์กํ์ง ์์ `ViewController` ์ ๊ตฌ์กฐ์ ๊ธฐ๋ฅ์ ๊ณ ๋ คํ์ฌ, MVC ์ํคํ์ณ๋ฅผ ์ ์ฉํ์์ต๋๋ค

<img width="1015" alt="์คํฌ๋ฆฐ์ท 2021-09-15 ์ค์  10 33 54" src="https://user-images.githubusercontent.com/64566207/133355956-b08ae693-d06f-4d62-b3cd-016dd3d27f0f.png">

<br>

### Storyboard๋ฅผ ํตํ ๋ ์ด์์ ๊ตฌ์ฑ

Console ์ฑ์ด ์๋ UI๋ฅผ ์ ์ฉํ๋ ์ฒซ ์ฑ์ธ ๋งํผ ๊ฐ์์ฑ์ด ํฐ ์ฅ์ ์ธ Storyboard๋ฅผ ์ด์ฉํด ๋ ์ด์์์ ๊ตฌ์ฑํ์ต๋๋ค. ๊ฐ ๊ธฐ๊ธฐ์ ๋์ํ๊ธฐ ์ํด AutoLayout์ ์ ์ฉ ํ์ต๋๋ค

<img src="https://user-images.githubusercontent.com/64566207/133024800-d3f52587-f8e3-4e63-ba3c-74b5eb394d6e.png" width="600">

<br>

<br>

## 2. ๊ธฐ๋ฅ

### ์ฅฌ์ค ์ฃผ๋ฌธ

์ฃผ๋ฌธ ๋ฒํผ์ ํตํด์ ํด๋น ์ฅฌ์ค๋ฅผ ์ฃผ๋ฌธํ๊ณ  ์ฌ๊ณ ๊ฐ ์์ ๋จ

<img src="https://user-images.githubusercontent.com/64566207/133024991-5a06c45d-2ae0-4e05-a427-ceaa0b97d128.gif" width="600">

<br>

### ์ฌ๊ณ  ๋ถ์กฑ์ ์ฌ๊ณ  ์์ 

์ฌ๊ณ  ๋ถ์กฑ์ ์ฌ๊ณ  ์์ ์ ์ํ ํ์ด์ง๋ก ์ด๋ (AlertController๋ฅผ ํตํด์ ํ์ด์ง ์ด๋)

<img src="https://user-images.githubusercontent.com/64566207/133024969-840a21de-df20-4de7-b873-1ccd154506db.gif" width="600">

<br>

### ์ฌ๊ณ  ์์  ํ์ด์ง ์ด๋

์ฌ๊ณ  ์์  ํ์ด์ง๋ฅผ ํตํด์ ์์ , `CounterViewController` ์ ํ๋ฉด์ผ๋ก ๋์๊ฐ ์ ์ฌ๊ณ  ์์ ์ด ๋ฐ์๋จ

<img src="https://user-images.githubusercontent.com/64566207/133024988-7696d162-ff81-48c4-8ca0-584e17fbb33b.gif" width="600">

<br>

### ์ ๊ทผ์ฑ์ Font Size ๋ณ๊ฒฝ์ ๋ฐ๋ฅธ UI ๋ณ๊ฒฝ

`Accessibility Inspector`๋ฅผ ํตํด์ Font Size ๋ณ๊ฒฝ -> UI์ ๋ฐ์

<img src="https://user-images.githubusercontent.com/64566207/133205869-83b3074b-eb52-412f-b1e1-8035e4002a7b.gif" width="700">

<br>

<br>

## 3. ์ค๊ณ ๋ฐ ๊ตฌํ

์ฅฌ์ค ์ฃผ๋ฌธ์ ์ญํ ์ ํ๋ `JuiceMaker` , ๊ณผ์ผ ์ ์ฅ์ ํ๋ `FruitStock` ๊ฐ์ฒด๋ฅผ ์ค์ฌ์ผ๋ก ์ค๊ณํจ. ์ง์ ๋์ด ์๋ `Juice` ์ `Fruit` ์ข๋ฅ๋ฅผ ์ฝ๊ฒ ํํํ  ์ ์๋๋ก ์ด๊ฑฐํ ํ์์ ์ฌ์ฉ. `Juice` ๋ ์ํผ๋ฅผ `Juice` ํ์์ ์ฐ์ฐ ํ๋กํผํฐ๋ก ๋๊ณ , ํ์ฉํ  ์ ์๋๋ก ํจ. `FruitInfos` Dictionary์ ๊ฒฝ์ฐ๋ Value ํ์์ Struct๋ก ์ค๊ณํจ์ ๋ฐ๋ผ ์ดํ ํ๋ก์ ํธ ํ์ฅ์ ์ด๋ฆฐ ๊ตฌ์กฐ๋ฅผ ๊ฐ์ ธ์ด

<img width="1075" alt="์คํฌ๋ฆฐ์ท 2021-09-15 ์ค์  10 31 49" src="https://user-images.githubusercontent.com/64566207/133355964-f48c23a9-48dc-4c44-a78d-1a918de4e998.png">

<br>

### ์ฅฌ์ค ์ฃผ๋ฌธ

๊ฐ ์ฅฌ์ค ์ฃผ๋ฌธ ๋ฒํผ์ ํฐ์น ์ ๊ฐ ์ฅฌ์ค ๋ ์ํผ์ ํด๋นํ๋ ๊ณผ์ผ ๊ฐ์๊ฐ ๊ฐ์๋๋ฉด์ ์ฅฌ์ค ์ฃผ๋ฌธ ์๋ฃ AlertController๊ฐ ํ๋ฉด์ ์์ฑ

```swift
final class CounterViewController: UIViewController {
  //...
  private let juiceMaker: JuiceMaker = JuiceMaker.shared
  //...
  @IBAction private func orderJuice(_ sender: UIButton) {
    let juice = classifyButton(sender)
    do {
      try juiceMaker.makeJuice(using: juice)
      alertOfSuccess(juice: juice)
    } catch {
      alertOfFail()
    }
    for (fruit, _) in juice.recipe {
      updateFruitCountLabel(fruit)
    }
  }
  
  private func classifyButton(_ button: UIButton) -> Juice {
    switch button {
      case orderStrawberryJuiceButton:
      return .strawberry
      case orderStrawberryBananaJuiceButton:
      return .strawberryBanana
      case orderBananaJuiceButton:
      return .banana
      case orderPineappleJuiceButton:
      return .pineapple
      case orderKiwiJuiceButton:
      return .kiwi
      case orderMangoKiwiJuiceButton:
      return .mangokiwi
      default:
      return .mango
    }
  }
}
```

7๊ฐ์ ์ฅฌ์ค ์ฃผ๋ฌธ ๋ฒํผ์ด ๋ชจ๋ `orderJuice(_ : UiButton)` ๋ฉ์๋๋ฅผ ํฐ์น ์ด๋ฒคํธ์ ๋ํ action์ผ๋ก ๊ฐ์ง๊ณ  ์๊ธฐ ๋๋ฌธ์ ๋งค๊ฐ๋ณ์๋ก ๋ค์ด์ค๋ button ์ด ์ด๋ค ๋ฒํผ์ธ์ง ๋ถ๋ฅํ๋ ๋ฉ์๋๋ฅผ ์์ฑํ์ต๋๋ค

<br>

**์ด๊ธฐ๊ตฌํ ๋ฐฉ๋ฒ**

```swift
class OrderButton: UIButton {
  let juice: Juice
}
final class CounterViewController: UIViewController {
  private let juiceMaker: JuiceMaker = JuiceMaker.shared
  //...
  @IBAction private func orderJuice(_ sender: UIButton) {
    do {
      try juiceMaker.makeJuice(using: sender.juice)
      alertOfSuccess(juice: juice)
    } catch {
      alertOfFail()
    }
    for (fruit, _) in juice.recipe {
      updateFruitCountLabel(fruit)
    }
  }
}
```

์ด๊ธฐ์๋ `View` ์ `juice` ํ๋กํผํฐ๋ฅผ ํตํด์ ํด๋น ๋ฒํผ์ด ๋ด๋นํ๊ณ  ์๋ ์ฅฌ์ค๋ฅผ ๊ฐ์ง๊ฒ ํ์์ต๋๋ค. ํ์ง๋ง, ํด๋น ๋ฐฉ๋ฒ์`View` ๊ฐ `Model` ์ ๋ํ ์์กด์ฑ์ ๊ฐ์ง๋ ๋ฐฉ๋ฒ์ด๊ธฐ์ ๋ฐฐ์ ํ์์ต๋๋ค

<br>

### ์ฌ๊ณ  ์์  ๋ฐ ์์ ์ฌํญ CounterViewController์ ๋ฐ์

๊ณผ์ผ ์ฌ๊ณ ๋ฅผ ๋งก๊ณ  ์๋ `FruitStock` ์ ๊ฐ์ง๊ณ  ์์ผ๋ฉฐ, ์ฅฌ์ค ์ฃผ๋ฌธ์ ๋งก๊ณ  ์๋ `JuiceMaker` ์ ๊ฒฝ์ฐ SingleTon ํจํด์ ํตํด์ ํ๋ก์ ํธ ๋ด ํ๋์ ํ์ ํ๋กํผํฐ๋ฅผ ๊ณต์ ํ๊ณ  ์์ต๋๋ค. ์ด๋ฅผ ํตํด์ ๋ค๋ฅธ `viewController` ์์์ ๋ณ๊ฒฝ์ ๋ํด ์ฝ๊ฒ ๋ฐ์ํ  ์ ์๊ฒ ์ค๊ณ ํ์ต๋๋ค.

```swift
class JuiceMaker {
  static let shared = JuiceMaker()
  private init()
 	//...
}

final class CounterViewController: UIViewController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    updateFruitCount()
  }
  
  private func updateFruitCount() {
    strawberryCountLabel.text = juiceMaker.count(of: .strawberry)
    bananaCountLabel.text = juiceMaker.count(of: .banana)
    kiwiCountLabel.text = juiceMaker.count(of: .kiwi)
    pineappleCountLabel.text = juiceMaker.count(of: .pineapple)
    mangoCountLabel.text = juiceMaker.count(of: .mango)
  }
}
```

<br>

### ์ ๊ทผ์ฑ์ Font Size ๋ณ๊ฒฝ์ ๋ฐ๋ฅธ UI ๋ณ๊ฒฝ

button์ ๊ฒฝ์ฐ storyboard์์ `Dynamic Type - Automatically Adjust Font` ์ค์ ์ด ์๋๋ฏ๋ก ์ฝ๋๋ฅผ ํตํด ์ค์ , Label์ ๊ฒฝ์ฐ๋ sotryboard์ `Interface Builder`๋ฅผ ํตํด์ ํด๋น ์์ฑ์ ์ค์ 

```swift
private func configureButtonsAccessibility() {
  orderStrawberryJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
  orderStrawberryBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
  orderBananaJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
  orderPineappleJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
  orderKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
  orderMangoJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
  orderMangoKiwiJuiceButton.titleLabel?.adjustsFontForContentSizeCategory = true
}
```

<img width="820" alt="์คํฌ๋ฆฐ์ท 2021-09-14 ์คํ 4 10 56" src="https://user-images.githubusercontent.com/64566207/133212019-389ed2af-0cb4-433d-92ca-70f6ed7b5eb0.png">

<br>

<br>

## ํ๋ก์ ํธ๋ฅผ ์งํํ๋ฉด์ ๊ณ ๋ฏผํ๋ ์ 

[Step1 PR - with Mason](https://github.com/yagom-academy/ios-juice-maker/pull/40)

[Step2 PR - with Mason](https://github.com/yagom-academy/ios-juice-maker/pull/63)

### JuiceMaker๋ฅผ ํด๋์ค๋ก ๊ตฌํํ ์ด์ ๋?

Juice๋ฅผ ๋ง๋๋ ์ญํ ์ ๊ฐ์ง ๊ฐ์ฒด๋ฅผ ์ค๊ณํ๋ ๊ณผ์ ์์ ํด๋น ์ฑ์์๋ ํ๋์ ์ ํฌ, ํ ๋ช์ ์ฅฌ์ค ๋ฉ์ด์ปค๋ง ์์ ๊ฒ์ ์๊ฐํ๊ธฐ์ ์ด๋์์๋  ์ฐธ์กฐ๋ฅผ ํ์ฌ ๊ฒฐ๊ณผ๋ฅผ ๋ฐ์ํ๊ณ ์ ํ์์ต๋๋ค. ๋ค๋ฅธ ํ์๋ค์ [WWDC 2016 - Understanding Swift Performance](https://developer.apple.com/videos/play/wwdc2016/416/) ๋ฅผ ์ฐธ๊ณ ํ์ฌ ์ฑ๋ฅ์ ๋์ด๊ณ ์ struct, enum๊ณผ ๊ฐ์ ๊ฐ ํ์์ผ๋ก ์ ์ํ์ต๋๋ค. (ํด๋น [PR](https://github.com/yagom-academy/ios-juice-maker/pull/40))

![์คํฌ๋ฆฐ์ท 2021-09-15 ์ค์  12 40 47](https://user-images.githubusercontent.com/64566207/133289479-b0e8ed9f-a38e-4f63-a998-ddd03c513166.png)

 <br>

### ์ข ๋ ๋ชํํ ๋ค์ด๋ฐ์ผ๋ก ์ฃผ์ ํ์ ์๋ ์ฝ๋ ์ง๋ณด๊ธฐ

```swift
func addStock(of fruit: Fruit, count: UInt)
```

[Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) ๋ฅผ ์ฐธ๊ณ ํ์ฌ ํ ๋ฌธ์ฅ์ผ๋ก ์ฝํ ์ ์๋ ์ฝ๋๋ฅผ ์งค ์ ์๋๋ก ํ์์ต๋๋ค. ์์ ๊ฐ์ด ์ ์ํ์ฌ, ํด๋น ๋ฉ์๋๋ฅผ ์ฌ์ฉํ  ๊ฒฝ์ฐ ์๋์ ๊ฐ์ด ์ฌ์ฉ๋์ด ํ ๋ฌธ์ฅ ๋ง์ผ๋ก๋ ์ ํํ ์๋ฏธ ์ ๋ฌ์ด ๊ฐ๋ฅํ๊ฒ ํ์์ต๋๋ค

```swift
pineappleCountLabel.text = juiceMaker.count(of: .pineapple)
```

<br>

### SingleTon ํจํด ์ฌ์ฉํ๊ธฐ

ํ๋ฉด ์ ํ์์ `JuiceMaker` ์ธ์คํด์ค ์ฐธ์กฐ๋ฅผ ์ง์  ์ ๋ฌํด์ผ๋๋ ๊ณผ์ ์ ์ค์ด๊ณ ์ ๊ณ ๋ฏผํ์์ต๋๋ค. ํ๋ช์ `JuiceMaker` ๋ง์ด ๊ฐ๊ฒ์์ ์ฅฌ์ค๋ฅผ ์์ฑํ๊ณ  ์ฌ๊ณ ๋ฅผ ๊ด๋ฆฌํ  ๊ฒ์ด๊ธฐ์, SingleTon์ ํตํ์ฌ ์ฐธ์กฐ์ ์์ ๊ณต์ ๋ฅผ ์ฉ์ดํ๊ฒ ํ์์ต๋๋ค. ๋ํ ํด๋น ํจํด์ ํ์ตํ๋ฉฐ ๋จ์ ๊น์ง ํ์ํ์ต๋๋ค.

- ๋จ์ 

  ํด๋น ํจํด์ ์ฌ์ฉํ๊ฒ ๋๋ค๋ฉด, Unit Test ๊ณผ์ ์์ ํ๋์ ์ธ์คํด์ค์ ๋ํ ์ฌ๋ฌ ํ์คํธ ์ผ์ด์ค์ ์ ๊ทผ์ด ์ด๋ค์ง๊ธฐ ๋๋ฌธ์ ๋ฌธ์ ๊ฐ ๋ฐ์ํ  ๊ฐ๋ฅ์ฑ์ด ์์ต๋๋ค

<br>

### NavigationBar์ ์๋์์ฑ๋๋ Back Button ์์ ๊ธฐ

NavigationController ์ Embed in ํ๊ฒ ๋๋ค๋ฉด, push ํ ์์ ์ด์  ํ๋ฉด์ผ๋ก ๋์๊ฐ๋ BackButton ์ด ์๋์์ฑ๋ฉ๋๋ค. ํด๋น Button์ ์์ ์ฃผ๋ ๋ฐฉ๋ฒ

1. NavigationController๋ฅผ Embed in ํ์ง ์๊ณ , Navigation Bar๋ฅผ ์ง์  ์์ฑํ๊ณ  `self.present(stockViewController, animated: true)` ๋ฅผ ํตํด์ ํ๋ฉด ์ ํ

2. NavigationController๋ฅผ Embed in ํ๊ณ ,` self.navigationItem.hidesBackButton = true` ๋ฅผ ํตํด BackButton ์ ๊ฑฐ

2๋ฒ ๋ฐฉ๋ฒ์ ์ฌ์ฉํ๋ฉด modal์ ๋ํ ์ค์ ์ด ๋ถํ์ํ๊ธฐ์ ํด๋น ๋ฐฉ๋ฒ์ ์ ํ

<br>

<br>

## ํธ๋ฌ๋ธ ์ํ

### Font Size ์ต๋์ Constraint ์ค๋ฅ ๋ฐ์

<img width="800" alt="์คํฌ๋ฆฐ์ท 2021-09-14 ์คํ 11 18 51" src="https://user-images.githubusercontent.com/64566207/133275117-b7ac867e-a026-47e6-ad8b-6ff42e308008.png">

```
(
    "<NSLayoutConstraint:0x600003a59310 UILabel:0x7fd9ca124820.top >= UILayoutGuide:0x60000206a840'TitleView(0x7fd9c7d11310)'.top   (active)>",
    "<NSLayoutConstraint:0x600003a59400 UILabel:0x7fd9ca124820.firstBaseline == UILayoutGuide:0x60000206a840'TitleView(0x7fd9c7d11310)'.top + 28   (active)>"
)
```

![์คํฌ๋ฆฐ์ท 2021-09-14 ์คํ 11 22 23](https://user-images.githubusercontent.com/64566207/133275853-a3f6161c-1e7d-4990-940b-0bbe815b8ab8.png)

ํด๋น ์๋ฌ ๋ฉ์์ง๋ฅผ [wtfautolayout.com](https://www.wtfautolayout.com) ์ ํตํด์ ๋๋ฒ๊น, NavigationBar ์ Title์ ๋ฐ์ํ๋ ๋ฌธ์ ์์ ๋ฐ๊ฒฌํ๊ณ  Storyboard๊ฐ ์๋ code๋ฅผ ํตํด์ title ์ถ๊ฐํ์ต๋๋ค. ์ ํํ ๋ฌธ์  ์์ธ์ ์ง๋จํ์ง๋ ๋ชปํ์ง๋ง ํด๊ฒฐํ์ต๋๋ค

<br>

### Juice Recipe์ ํด๋น๋๋ ๊ณผ์ผ ๋ชจ๋๊ฐ ๋ง์กฑํ์ง ์์ผ๋ฉด ์คํจํ๋๋ก ๊ตฌํ

```swift
func order(juice: Juice) throws {
	for (ingredient, information) in juice.recipe {
    guard stock.readCount(of: ingredient) >=  information.count else {
      throw JuiceMakerError.outOfStock
    }
    stock.subtract(of: ingredient, count: information.count)
  }
}
```

for๋ฌธ์ ์ ํํ๋ฉด์ ์ฌ๋ฃ๊ฐ ๋ง์กฑํ๋ฉด, ์ฌ๊ณ ๊ฐ ์ค์ด๋ค๊ฒ ํจ. ์ดํ ์ฌ๋ฃ๊ฐ ๋ง์กฑํ์ง ์์ `outOfStock` ์๋ฌ๊ฐ throw ๋๋ค๊ณ  ํด๋ ์ด๋ฏธ ์ค์ด๋  ์ฌ๊ณ ๊ฐ ์๊ธฐ์ ์์ ์ด ํ์

```swift
func order(juice: Juice) throws {
  let isSatisfied = juice.recipe.allSatisfy { (ingredient: Fruit, information: FruitInformation) in
      return stock.count(of: ingredient) >= information.count
  }
  if isSatisfied == false {
    throw JuiceMakerError.outOfStock
  }
  for (ingredient, information) in juice.recipe {
    stock.subtract(fruit: ingredient, count: information.count)
  }
}
```

`allSatisfy` ๊ณ ์ฐจํจ์๋ฅผ ํตํด์ element๋ค์ด ๋ชจ๋ `์ฌ๊ณ  > ๋ ์ํผ` ๋ฅผ ๋ง์กฑํ๋์ง ํ์ธ

<br>

<br>

### ํด๋น ํ๋ก์ ํธ๋ฅผ ํตํด์ ํ์ตํ ํค์๋

- extension ์ ํตํ ํ์ ํ์ฅ
- UIAleretController, UIAlertAction
- NSLayoutConstraint
- SingleTon
- ๊ณ ์ฐจํจ์ allSatisfy

- ํ์ฅ์ ์ฉ์ดํ ๊ตฌ์กฐ
- Accessibility

<br>

<br>