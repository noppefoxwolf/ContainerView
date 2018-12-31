<h1 align="center">
  ContainerView
  <br>
</h1>

## Embed Content

```swift

class ViewController: UIViewController, Embedable {}

let containerView = ContainerView<ViewController>(frame: .zero)
let vc = ViewController()
containerView.embed(vc, parent: self)

```

## Digup Content

```swift
containerView.digUp()
```

## Access Content

```swift
containerView.content?.backgroundColor
```
