# CAAnimationCallback

A block-based callbacks for CAAnimation. Compatible to macOS and iOS.

# Usage

Add the package `CAAnimationCallback` with Swift Package Manager.

```swift
let anim = CAAnimation()
anim.startHandler { anim, finished in
	// The animation is started. `finished` is always true.
}
anim.completionHandler { anim, finished in
	// The animation is completed.
}

theLayer.add(anim, forKey: nil)
``` 
# License

See [LICENSE](./LICENSE) for details.
