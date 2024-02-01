import Foundation

class UserRepository {
    
    var localSource : UserLocalSource
    
    init(localSource: UserLocalSource) {
        self.localSource = localSource
    }
    
}
