//
//  SecondaryPageViewController.swift
//  SplitView_Test2
//
//  Created by Maxim Mitin on 12.12.21.
//

import UIKit

class SecondaryPageViewController: UIPageViewController {
    
    fileprivate lazy var pages: [UIViewController] = {
        return  [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "redViewController"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "blueViewController"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "greenViewController")
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        if let firstViewController = pages.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

}


extension SecondaryPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {return nil}
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return pages.last}
        guard pages.count > previousIndex else {
            return nil
        }
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {return nil}
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return pages.first}
        guard pages.count > nextIndex else {
            return nil
        }
        return pages[nextIndex]
    }
}
