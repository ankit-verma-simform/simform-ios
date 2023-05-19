//
//  UIViewExtensions.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/05/23.
//

import UIKit

extension UIView {
    // MARK: - Corners
    func roundCorners(cornerRadius: CGFloat = 20,
                      top: Bool = false,
                      bottom: Bool = false) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        guard top || bottom else {
            return
        }
        var caCornerMask = CACornerMask()
        if top {
            caCornerMask.insert(.layerMinXMinYCorner)
            caCornerMask.insert(.layerMaxXMinYCorner)
        }
        if bottom {
            caCornerMask.insert(.layerMinXMaxYCorner)
            caCornerMask.insert(.layerMaxXMaxYCorner)
        }
        layer.maskedCorners = caCornerMask
    }
    
    func resetCorners() {
        layer.cornerRadius = 0
    }
    
    // MARK: - Borders
    @discardableResult
    func addBorders(edges: UIRectEdge,
                    color: UIColor,
                    inset: CGFloat = 0.0,
                    thickness: CGFloat = 1.0) -> [UIView] {
        var borders = [UIView]()

        @discardableResult
        func addBorder(formats: String...) -> UIView {
            let border = UIView(frame: .zero)
            border.backgroundColor = color
            border.translatesAutoresizingMaskIntoConstraints = false
            addSubview(border)
            addConstraints(formats.flatMap {
                NSLayoutConstraint.constraints(withVisualFormat: $0,
                                               options: [],
                                               metrics: ["inset": inset, "thickness": thickness],
                                               views: ["border": border]) })
            borders.append(border)
            return border
        }
        if edges.contains(.top) || edges.contains(.all) {
            addBorder(formats: "V:|-0-[border(==thickness)]", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.bottom) || edges.contains(.all) {
            addBorder(formats: "V:[border(==thickness)]-0-|", "H:|-inset-[border]-inset-|")
        }
        if edges.contains(.left) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:|-0-[border(==thickness)]")
        }
        if edges.contains(.right) || edges.contains(.all) {
            addBorder(formats: "V:|-inset-[border]-inset-|", "H:[border(==thickness)]-0-|")
        }
        return borders
    }
}
