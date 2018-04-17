//
//  NCPageViewController.swift
//
//  Created by 孙一萌 on 2018/4/14.
//  Copyright © 2018年 iMoe Nya. All rights reserved.
//

import UIKit

class NCPageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let dataSource = dataSource as? NCPageViewControllerDataSource else { return }
        guard let firstController = dataSource.viewControllerArray?.first        else { return }
        setViewControllers([firstController], direction: .forward, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
