//
//  ContainerView.swift
//  App
//
//  Created by Tomoya Hirano on 2018/12/19.
//

import UIKit

public protocol Embedable {
    
    func embed(to: UIView, parent: UIViewController)
    
    @discardableResult
    func digUp(from: UIView) -> Self?
}

public extension Embedable where Self: UIViewController {
    
    func embed(to: UIView, parent: UIViewController) {
        digUp(from: to)
        
        willMove(toParent: parent)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        to.addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: to.topAnchor),
            view.leftAnchor.constraint(equalTo: to.leftAnchor),
            view.rightAnchor.constraint(equalTo: to.rightAnchor),
            view.bottomAnchor.constraint(equalTo: to.bottomAnchor),
        ])
        
        parent.addChild(self)
        didMove(toParent: parent)
    }
    
    @discardableResult
    func digUp(from: UIView) -> Self? {
        willMove(toParent: nil)
        from.subviews.forEach({ $0.removeFromSuperview() })
        removeFromParent()
        return self
    }
}

public extension Embedable where Self: UIView {
    
    func embed(to: UIView, parent: UIViewController) {
        digUp(from: to)
        
        translatesAutoresizingMaskIntoConstraints = false
        to.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: to.topAnchor),
            leftAnchor.constraint(equalTo: to.leftAnchor),
            rightAnchor.constraint(equalTo: to.rightAnchor),
            bottomAnchor.constraint(equalTo: to.bottomAnchor),
        ])
    }
    
    @discardableResult
    func digUp(from: UIView) -> Self? {
        removeFromSuperview()
        return self
    }
}

final public class View<T: Embedable>: UIView {
    public private(set) var content: T? = nil
    
    public func embed(_ content: T, parent: UIViewController) {
        content.embed(to: self, parent: parent)
        self.content = content
    }
    
    public func digUp() {
        content?.digUp(from: self)
        content = nil
    }
}
