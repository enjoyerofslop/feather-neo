//
//  UIApplication+topController.swift
//  Loader
//
//  Created by samara on 18.03.2025.
//

import UIKit.UIApplication

extension UIApplication {
	/// This belongs to https://stackoverflow.com/a/30858591
	/// Key window of the active scene, rather than `keyWindow` across every scene
	/// (the app can have several, e.g. on iPhone Duo or iPad)
	public var activeKeyWindow: UIWindow? {
		let scenes = connectedScenes.compactMap { $0 as? UIWindowScene }
		let activeScenes = scenes.filter { $0.activationState == .foregroundActive }
		return (activeScenes.isEmpty ? scenes : activeScenes).lazy.compactMap(\.keyWindow).first
	}

	/// This belongs to https://stackoverflow.com/a/30858591
	public class func topViewController(controller: UIViewController? = UIApplication.shared.activeKeyWindow?.rootViewController) -> UIViewController? {
		if let navigationController = controller as? UINavigationController {
			return topViewController(controller: navigationController.visibleViewController)
		}
		if let tabController = controller as? UITabBarController {
			if let selected = tabController.selectedViewController {
				return topViewController(controller: selected)
			}
		}
		if let presented = controller?.presentedViewController {
			return topViewController(controller: presented)
		}
		return controller
	}
}
