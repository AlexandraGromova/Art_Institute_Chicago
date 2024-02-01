
import Foundation
import SwiftUI

class UserVM: ObservableObject {
    
    var repository : UserRepository
    let defaults = UserDefaults.standard
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func saveUserName(name: Any) {
        defaults.set(name, forKey: "userName")
    }
    
    func saveDateRegist() {
        let date = Date()
        let calendar = Calendar.current
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        defaults.set(date.toSting(), forKey: "dateRegist")
    }
    
    func getDateRegist() -> String {
        var date = defaults.string(forKey: "dateRegist")
        return date!
    }
    
    func getUserName(for key: String) -> String? {
        return (defaults.object(forKey: key) as! String?)
    }
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileName.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
}
