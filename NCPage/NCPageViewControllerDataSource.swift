//
//  NCPageViewControllerDataSource.swift
//
//  Created by 孙一萌 on 2018/4/14.
//  Copyright © 2018年 iMoe Nya. All rights reserved.
//

import UIKit

class NCPageViewControllerDataSource: NSObject, UIPageViewControllerDataSource {
    
    var viewControllerArray: Array<UIViewController>?
    
    // set this from storyboard user defined runtime attributes
    // fill in names of storyboard, separate with "," with no space
    @objc var runtimeStoryboardNames = "" {
        didSet {
            let nameArray = runtimeStoryboardNames.storyboardRuntimeAttributesArray()
            viewControllerArray = nameArray.map { (name) in
                let storyboard = UIStoryboard.init(name: name, bundle: nil)
                guard let viewController = storyboard.instantiateInitialViewController() else {
                    fatalError("Storyboard \(name) has no initial view controller.")
                }
                return viewController
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = viewControllerArray else { return nil }
        guard let viewControllerIndex = viewControllers.index(of: viewController) else { return nil }
        if viewControllerIndex == 0 { return nil }
        else { return viewControllers[viewControllerIndex - 1] }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllers = viewControllerArray else { return nil }
        guard let viewControllerIndex = viewControllers.index(of: viewController) else { return nil }
        if viewControllerIndex == viewControllers.count - 1 { return nil }
        else { return viewControllers[viewControllerIndex + 1] }
    }
}

extension String {
    fileprivate func storyboardRuntimeAttributesArray() -> Array<String> {
        return split(separator: ",").map { String($0) }
    }
}
