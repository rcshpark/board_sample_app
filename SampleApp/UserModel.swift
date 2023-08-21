import Foundation

struct UserModel : Identifiable {
    var id : UUID = UUID()
    var email : String?
    var name : String?
}
