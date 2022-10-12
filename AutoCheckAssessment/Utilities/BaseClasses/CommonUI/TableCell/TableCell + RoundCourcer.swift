//
//  TableCell + RoundCourcer.swift
//  HRA
//
//  Created by Qenawi on 13/03/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import UIKit

extension UITableViewCell {
    func whiteRoundCorner(padding: CGFloat?, corner: CGFloat?) {
        let padding: CGFloat = padding ?? CGFloat(10)
        let maskLayer = CALayer()
        maskLayer.cornerRadius = corner ?? CGFloat(10)
        maskLayer.backgroundColor = UIColor.white.cgColor
        maskLayer.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.width, height: self.bounds.height).insetBy(dx: padding, dy: padding / 2)
        self.layer.mask = maskLayer
    }
}
