//
//  BaseNavigationController.swift
//  HRA
//
//  Created by Alchemist on 27/02/2021.
//  Copyright © 2021 Cashless. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isNavigationBarHidden = true
        //  Adding swipe to pop viewController
        self.interactivePopGestureRecognizer?.isEnabled = true
        self.interactivePopGestureRecognizer?.delegate = self
//        self.view.semanticContentAttribute = LocalizationManager.currentLanguage().contains("ar") ? .forceRightToLeft : .forceLeftToRight
//        self.navigationBar.semanticContentAttribute = LocalizationManager.currentLanguage().contains("ar") ? .forceRightToLeft : .forceLeftToRight
    }

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        topViewController?.preferredStatusBarStyle ?? .default
    }
}

extension BaseNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }

    func navigationController(_: UINavigationController, willShow _: UIViewController, animated _: Bool) {}
}
