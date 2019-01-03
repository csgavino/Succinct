import UIKit

struct UIViewControllerBuilder {
    private var viewController: UIViewController

    init() {
        viewController = UIViewController()
    }

    func withSubview(_ subView: UIView) -> UIViewControllerBuilder {
        viewController.view.addSubview(subView)
        return self
    }

    func withSubviews(_ subviews: UIView...) -> UIViewControllerBuilder {
        subviews.forEach { subview in
            viewController.view.addSubview(subview)
        }
        
        return self
    }

    func withLeftBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem,
            targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: barButtonSystemItem,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        viewController.navigationItem.leftBarButtonItem = barButtonItem

        return self
    }

    func withRightBarButtonItem(
        barButtonSystemItem: UIBarButtonItem.SystemItem,
        targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: barButtonSystemItem,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )
        
        viewController.navigationItem.rightBarButtonItem = barButtonItem
        
        return self
    }

    func build() -> UIViewController {
        return viewController
    }
}
