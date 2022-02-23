//
//  CAAnimationCallback.swift
//  CAAnimationCallback
//
//  Created by usagimaru on 2022/02/23.
//

import QuartzCore

public typealias CAAnimationCallbackBlock = (CAAnimation, Bool) -> ()

public class CAAnimationCallbackProxy: NSObject, CAAnimationDelegate {
	
	var startHandler: CAAnimationCallbackBlock?
	var completionHandler: CAAnimationCallbackBlock?
	
	public func animationDidStart(_ anim: CAAnimation) {
		self.startHandler?(anim, true)
	}
	
	public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		self.completionHandler?(anim, flag)
	}
	
}

public extension CAAnimation {
	
	func startHandler(_ callback: @escaping CAAnimationCallbackBlock) {
		if let delegate = self.delegate as? CAAnimationCallbackProxy {
			delegate.startHandler = callback
		}
		else {
			let delegate = CAAnimationCallbackProxy()
			delegate.startHandler = callback
			self.delegate = delegate
		}
	}
	
	func completionHandler(_ callback: @escaping CAAnimationCallbackBlock) {
		if let delegate = self.delegate as? CAAnimationCallbackProxy {
			delegate.completionHandler = callback
		}
		else {
			let delegate = CAAnimationCallbackProxy()
			delegate.completionHandler = callback
			self.delegate = delegate
		}
	}
	
}
