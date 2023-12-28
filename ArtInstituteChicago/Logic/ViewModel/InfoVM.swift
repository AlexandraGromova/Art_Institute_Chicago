import Foundation

class InfoVM: ObservableObject {
    
    private let admissions = ["General Admission", "Chicago Residents", "Illinos Resident", "Fast Pass"]
    private let ages = ["Adult","Seniors (65+)","Students","Teens (14-17)","Children","Members"]
    private let days = ["Mon", "Tue–Wed", "Thu", "Fri–Sun"]
    private let hours = ["11-5", "Closed", "11-8", "11-5"]
    @Published var prices: [String] = []
    
    init() {
        updatePrices()
    }
    
    func getAdmissions() -> [String] {
        return admissions
    }
    
    func getAges() -> [String] {
        return ages
    }
    
    func getDays() -> [String] {
        return days
    }
    
    func getHours() -> [String] {
        return hours
    }
    
    
    func updatePrices(admission: String = "") {
        switch admission {
        case "General Admission":
            prices = ["$32","$26","$26","$26","Free","Free"]
        case "Chicago Residents":
            prices = ["$20","$14","$14","Free","Free","Free"]
        case "Illinos Resident":
            prices = ["$27","$21","$21","$21","Free","Free"]
            
        case "Fast Pass" :
            prices = ["$40","$34","$34","$34","Free","Free"]
            
        default:
            prices = ["$32","$26","$26","$26","Free","Free"]
        }
    }
}
