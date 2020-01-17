import Foundation

let usersJSON =
"""
{
    "users": [
        {
            "firstName": "Jim",
            "lastName": "Halpert",
            "age": 34,
            "birthday": "1982-05-24",
            "createdAt" : "2020-01-14T15:14:43+0000"
        },
        {
            "firstName": "Pam",
            "lastName": "Beesly",
            "age": 29,
            "birthday": "1987-10-12",
            "createdAt" : "2020-01-14T15:14:43+0000"
        }
    ]
}
"""

struct User : Codable {
    let firstName: String
    let lastName: String
    let age: Int
}

struct UsersWrapper : Codable {
    let users:  [User]
}

let data = usersJSON.data(using: .utf8)!
let decoder = JSONDecoder()
let users = try! decoder.decode(UsersWrapper.self, from: data).users

print(users)
