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
//      test1()
//      test2()
//      test3()
   }
   override var prefersStatusBarHidden: Bool { return false }
}
class MainView: UIView { }
//extension MainVC {
//   /**
//    * Testing a regular pagination service
//    */
//   func test1() {
//      TrackPaginationService.getItems(index: 0, length: 50) { result in // 50
//         let tracks: [Track]?  = try? result.get()
//         Swift.print("1. artistName: \(String(describing: tracks?.first?.artistName)) count: \(String(describing: tracks?.count))")
//      }
//      TrackPaginationService.getItems(index: 120, length: 50) { result in // 8
//         let tracks: [Track]?  = try? result.get()
//         Swift.print("2. artistName: \(String(describing: tracks?.first?.artistName)) count: \(String(describing: tracks?.count))")
//      }
//      TrackPaginationService.getItems(index: 160, length: 50) { result in // false, 0
//         let tracks: [Track]?  = try? result.get()
//         Swift.print("3. artistName: \(String(describing: tracks?.first?.artistName)) count: \(String(describing: tracks?.count))")
//      }
//   }
//   /**
//    * Debugging Pagination service
//    */
//   func test2() {
//      let b = CustomPaginationService.items
//      b.forEach { Swift.print("\($0)") }
//      Swift.print("b:  \(b.count)")
//   }
//   /**
//    * Testing A Custom pagination service
//    */
//   func test3() {
//      CustomPaginationService.getItems(index: 0, length: 50) { result in // 50
//         let tracks: [String]?  = try? result.get()
//         Swift.print("1. count: \(String(describing: tracks?.count))")
//      }
//      CustomPaginationService.getItems(index: 120, length: 50) { result in // 30
//         let tracks: [String]?  = try? result.get()
//         Swift.print("2. count: \(String(describing: tracks?.count))")
//      }
//      CustomPaginationService.getItems(index: 160, length: 50) { result in // false, 0
//         let tracks: [String]?  = try? result.get()
//         Swift.print("3. count: \(String(describing: tracks?.count))")
//      }
//   }
//}
