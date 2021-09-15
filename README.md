# 🥤 쥬스 메이커 프로젝트

(with [yun)](https://github.com/blanche37)

📅 과제 진행 기간 : 2021-03-08 ~ 2021-03-19

<br>

## 1. Overview

과일의 재고를 파악하고, 쥬스를 생성할 수 있습니다

재고 부족시에는 재고를 조절하는 인터페이스가 있는 애플리케이션입니다

해당 애플리케이션은 **iPhone - 가로 전용 모드** 만을 지원합니다

<br>

### MVC

복잡하지 않은 `ViewController` 의 구조와 기능을 고려하여, MVC 아키텍쳐를 적용하였습니다

<img width="1015" alt="스크린샷 2021-09-15 오전 10 33 54" src="https://user-images.githubusercontent.com/64566207/133355956-b08ae693-d06f-4d62-b3cd-016dd3d27f0f.png">

<br>

### Storyboard를 통한 레이아웃 구성

Console 앱이 아닌 UI를 적용하는 첫 앱인 만큼 가시성이 큰 장점인 Storyboard를 이용해 레이아웃을 구성했습니다. 각 기기에 대응하기 위해 AutoLayout을 적용 했습니다

<img src="https://user-images.githubusercontent.com/64566207/133024800-d3f52587-f8e3-4e63-ba3c-74b5eb394d6e.png" width="600">

<br>

<br>

## 2. 기능

### 쥬스 주문

주문 버튼을 통해서 해당 쥬스를 주문하고 재고가 수정됨

<img src="https://user-images.githubusercontent.com/64566207/133024991-5a06c45d-2ae0-4e05-a427-ceaa0b97d128.gif" width="600">

<br>

### 재고 부족시 재고 수정

재고 부족시 재고 수정을 위한 페이지로 이동 (AlertController를 통해서 페이지 이동)

<img src="https://user-images.githubusercontent.com/64566207/133024969-840a21de-df20-4de7-b873-1ccd154506db.gif" width="600">

<br>

### 재고 수정 페이지 이동

재고 수정 페이지를 통해서 수정, `CounterViewController` 의 화면으로 돌아갈 시 재고 수정이 반영됨

<img src="https://user-images.githubusercontent.com/64566207/133024988-7696d162-ff81-48c4-8ca0-584e17fbb33b.gif" width="600">

<br>

### 접근성의 Font Size 변경에 따른 UI 변경

`Accessibility Inspector`를 통해서 Font Size 변경 -> UI에 반영

<img src="https://user-images.githubusercontent.com/64566207/133205869-83b3074b-eb52-412f-b1e1-8035e4002a7b.gif" width="700">

<br>

<br>

## 3. 설계 및 구현

쥬스 주문의 역할을 하는 `JuiceMaker` , 과일 저장을 하는 `FruitStock` 객체를 중심으로 설계함. 지정되어 있는 `Juice` 와 `Fruit` 종류를 쉽게 표현할 수 있도록 열거형 타입을 사용. `Juice` 레시피를 `Juice` 타입의 연산 프로퍼티로 두고, 활용할 수 있도록 함. `FruitInfos` Dictionary의 경우는 Value 타입을 Struct로 설계함에 따라 이후 프로젝트 확장에 열린 구조를 가져옴

<img width="1075" alt="스크린샷 2021-09-15 오전 10 31 49" src="https://user-images.githubusercontent.com/64566207/133355964-f48c23a9-48dc-4c44-a78d-1a918de4e998.png">

<br>

### 쥬스 주문

각 쥬스 주문 버튼을 터치 시 각 쥬스 레시피에 해당하는 과일 개수가 감소되면서 쥬스 주문 완료 AlertController가 화면에 생성

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

7개의 쥬스 주문 버튼이 모두 `orderJuice(_ : UiButton)` 메서드를 터치 이벤트에 대한 action으로 가지고 있기 때문에 매개변수로 들어오는 button 이 어떤 버튼인지 분류하는 메서드를 생성했습니다

<br>

**초기구현 방법**

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

초기에는 `View` 에 `juice` 프로퍼티를 통해서 해당 버튼이 담당하고 있는 쥬스를 가지게 하였습니다. 하지만, 해당 방법은`View` 가 `Model` 에 대한 의존성을 가지는 방법이기에 배제하였습니다

<br>

### 재고 수정 및 수정사항 CounterViewController에 반영

과일 재고를 맡고 있는 `FruitStock` 을 가지고 있으며, 쥬스 주문을 맡고 있는 `JuiceMaker` 의 경우 SingleTon 패턴을 통해서 프로젝트 내 하나의 타입 프로퍼티를 공유하고 있습니다. 이를 통해서 다른 `viewController` 에서의 변경에 대해 쉽게 반영할 수 있게 설계 했습니다.

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

### 접근성의 Font Size 변경에 따른 UI 변경

button의 경우 storyboard에서 `Dynamic Type - Automatically Adjust Font` 설정이 안되므로 코드를 통해 설정, Label의 경우는 sotryboard의 `Interface Builder`를 통해서 해당 속성을 설정

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

<img width="820" alt="스크린샷 2021-09-14 오후 4 10 56" src="https://user-images.githubusercontent.com/64566207/133212019-389ed2af-0cb4-433d-92ca-70f6ed7b5eb0.png">

<br>

<br>

## 프로젝트를 진행하면서 고민했던 점

[Step1 PR - with Mason](https://github.com/yagom-academy/ios-juice-maker/pull/40)

[Step2 PR - with Mason](https://github.com/yagom-academy/ios-juice-maker/pull/63)

### JuiceMaker를 클래스로 구현한 이유는?

Juice를 만드는 역할을 가진 객체를 설계하는 과정에서 해당 앱에서는 하나의 점포, 한 명의 쥬스 메이커만 있을 것을 생각했기에 어디에서든 참조를 하여 결과를 반영하고자 하였습니다. 다른 타입들은 [WWDC 2016 - Understanding Swift Performance](https://developer.apple.com/videos/play/wwdc2016/416/) 를 참고하여 성능을 높이고자 struct, enum과 같은 값 타입으로 정의했습니다. (해당 [PR](https://github.com/yagom-academy/ios-juice-maker/pull/40))

![스크린샷 2021-09-15 오전 12 40 47](https://user-images.githubusercontent.com/64566207/133289479-b0e8ed9f-a38e-4f63-a998-ddd03c513166.png)

 <br>

### 좀 더 명확한 네이밍으로 주석 필요 없는 코드 짜보기

```swift
func addStock(of fruit: Fruit, count: UInt)
```

[Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/) 를 참고하여 한 문장으로 읽힐 수 있는 코드를 짤 수 있도록 하였습니다. 위와 같이 정의하여, 해당 메서드를 사용할 경우 아래와 같이 사용되어 한 문장 만으로도 정확한 의미 전달이 가능하게 하였습니다

```swift
pineappleCountLabel.text = juiceMaker.count(of: .pineapple)
```

<br>

### SingleTon 패턴 사용하기

화면 전환시에 `JuiceMaker` 인스턴스 참조를 직접 전달해야되는 과정을 줄이고자 고민하였습니다. 한명의 `JuiceMaker` 만이 가게에서 쥬스를 생성하고 재고를 관리할 것이기에, SingleTon을 통하여 참조와 자원 공유를 용이하게 하였습니다. 또한 해당 패턴을 학습하며 단점까지 파악했습니다.

- 단점

  해당 패턴을 사용하게 된다면, Unit Test 과정에서 하나의 인스턴스에 대한 여러 테스트 케이스의 접근이 이뤄지기 때문에 문제가 발생할 가능성이 있습니다

<br>

### NavigationBar의 자동생성되는 Back Button 없애기

NavigationController 을 Embed in 하게 된다면, push 할시에 이전 화면으로 돌아가는 BackButton 이 자동생성됩니다. 해당 Button을 없애주는 방법

1. NavigationController를 Embed in 하지 않고, Navigation Bar를 직접 생성하고 `self.present(stockViewController, animated: true)` 를 통해서 화면 전환

2. NavigationController를 Embed in 하고,` self.navigationItem.hidesBackButton = true` 를 통해 BackButton 제거

2번 방법을 사용하면 modal에 대한 설정이 불필요하기에 해당 방법을 선택

<br>

<br>

## 트러블 슈팅

### Font Size 최대시 Constraint 오류 발생

<img width="800" alt="스크린샷 2021-09-14 오후 11 18 51" src="https://user-images.githubusercontent.com/64566207/133275117-b7ac867e-a026-47e6-ad8b-6ff42e308008.png">

```
(
    "<NSLayoutConstraint:0x600003a59310 UILabel:0x7fd9ca124820.top >= UILayoutGuide:0x60000206a840'TitleView(0x7fd9c7d11310)'.top   (active)>",
    "<NSLayoutConstraint:0x600003a59400 UILabel:0x7fd9ca124820.firstBaseline == UILayoutGuide:0x60000206a840'TitleView(0x7fd9c7d11310)'.top + 28   (active)>"
)
```

![스크린샷 2021-09-14 오후 11 22 23](https://user-images.githubusercontent.com/64566207/133275853-a3f6161c-1e7d-4990-940b-0bbe815b8ab8.png)

해당 에러 메시지를 [wtfautolayout.com](https://www.wtfautolayout.com) 을 통해서 디버깅, NavigationBar 의 Title에 발생하는 문제임을 발견하고 Storyboard가 아닌 code를 통해서 title 추가했습니다. 정확한 문제 원인을 진단하지는 못했지만 해결했습니다

<br>

### Juice Recipe에 해당되는 과일 모두가 만족하지 않으면 실패하도록 구현

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

for문을 선회하면서 재료가 만족하면, 재고가 줄어들게 함. 이후 재료가 만족하지 않아 `outOfStock` 에러가 throw 된다고 해도 이미 줄어든 재고가 있기에 수정이 필요

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

`allSatisfy` 고차함수를 통해서 element들이 모두 `재고 > 레시피` 를 만족하는지 확인

<br>

<br>

### 해당 프로젝트를 통해서 학습한 키워드

- extension 을 통한 타입 확장
- UIAleretController, UIAlertAction
- NSLayoutConstraint
- SingleTon
- 고차함수 allSatisfy

- 확장에 용이한 구조
- Accessibility

<br>

<br>