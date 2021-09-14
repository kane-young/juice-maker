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

![스크린샷 2021-09-14 오후 2.56.09](/Users/leeyoungwoo/Desktop/스크린샷 2021-09-14 오후 2.56.09.png)

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

<img width="979" alt="스크린샷 2021-09-14 오후 2 40 55" src="https://user-images.githubusercontent.com/64566207/133207735-986b228d-b34f-489c-8f5a-7f7604c5b3f9.png">

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

## 트러블 슈팅

### 재고 수정이 CounterViewController에 반영이 되지 않는 문제



### 적용해 본 것들

- extension 을 통한 타입 확장
- UIAleretController, UIAlertAction
- NSLayoutConstraint
- SingleTon
- 고차함수 allSatisfy

- 확장에 용이한 구조
- Accessibility

<br>

**해당 프로젝트를 진행하면서 학습한 개념**

- class와 struct의 차이

