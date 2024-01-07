//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by kevin alexander on 19/12/23.
//

import Foundation
import UIKit


protocol OnboardingViewControllerDelegate: AnyObject {
    func didFinishOnboarding( )
    func didCloseOnboarding( )
}
class OnboardingContainerViewController: UIViewController {

    weak var onboardingViewControllerDelegate: OnboardingViewControllerDelegate?
    
    
    let pageViewController: UIPageViewController
    let closeButton = UIButton(type: .system)
    var pages = [UIViewController]()
    var currentVC: UIViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(imageName: "delorean", titleText: "Bankey is faster, earier to use, and has a brand new look and feel that will make you feel like old.")
        let page2 = OnboardingViewController(imageName: "thumbs", titleText: "Bankey is faster, earier to use, and has a brand new look and feel that will make you feel like old.")
        let page3 = OnboardingViewController(imageName: "world", titleText: "Move your money everywhere ")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPurple
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
        
        style( )
        layout()
    }
}

extension OnboardingContainerViewController {
    private func style( ){
        setTranslatesAutoresizingMask(UIArray: [closeButton])
        closeButton.setTitle("close", for: [])
        closeButton.addTarget(self, action: #selector(onCloseOnboarding), for: .primaryActionTriggered)
    }
    
    private func layout( ){
        addSubViews(UIArray: [closeButton])
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
        ])
        
    }
    
    @objc func onCloseOnboarding ( ){
        onboardingViewControllerDelegate?.didCloseOnboarding()
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { 
            onboardingViewControllerDelegate?.didFinishOnboarding()
            return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}
extension OnboardingContainerViewController {
    
    private func setTranslatesAutoresizingMask( UIArray: [UIView] ){
        for UIview in UIArray {
            UIview.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    
    private func addSubViews( UIArray: [UIView] ){
        for UIview in UIArray {
            view.addSubview(UIview)
        }
    }
}
