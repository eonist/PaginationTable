import UIKit
import PaginationServiceiOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   lazy var window: UIWindow? = {
      let win = UIWindow(frame: UIScreen.main.bounds)
      let vc = MainVC()
      win.rootViewController = vc
      win.makeKeyAndVisible()/*Important since we have no Main storyboard anymore*/
      return win
   }()
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      _ = window
      return true
   }
}
class MainVC: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view = MainView()
      view.backgroundColor = .orange
      _ = {
         TrackPaginationService.getItems(index: 0, length: 50) { success, tracks in Swift.print("success: \(success) artistName: \(String(describing: tracks.first?.artistName)) count: \(tracks.count)") }
         TrackPaginationService.getItems(index: 120, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } // 30
         TrackPaginationService.getItems(index: 160, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //false, 0
      }()
      _ = {
         let b = CustomPaginationService.items
         b.forEach { Swift.print("\($0)") }
         Swift.print("b:  \(b.count)")
      }
      _ = {
         CustomPaginationService.getItems(index: 0, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") }
         CustomPaginationService.getItems(index: 120, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } // 30
         CustomPaginationService.getItems(index: 160, length: 50) { success, tracks in Swift.print("success: \(success) \(tracks.count)") } //false, 0
      }
   }
   override var prefersStatusBarHidden: Bool { return false }
}
class MainView: UIView { }
