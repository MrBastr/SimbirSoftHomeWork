

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        if (UserDefaults.standard.bool(forKey: "notFirstLaunch") == false) {
            UserDefaults.standard.set(true, forKey: "notFirstLaunch")
            window?.rootViewController = OnboardVC()
        } else {
            let nc = UINavigationController(rootViewController: CalendarVC())
            nc.navigationBar.backgroundColor = .systemBackground
            window?.rootViewController = nc
        }
        
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {
 
    }


}

