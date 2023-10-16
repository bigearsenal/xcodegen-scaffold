import Foundation

public struct Train: Hashable {
    public let id: Int
    public let name: String
    public let capacity: Int
}

public let trains: [Train] = [
    Train(id: 1, name: "ICE", capacity: 403),
    Train(id: 2, name: "Regio", capacity: 380),
    Train(id: 3, name: "SBahn", capacity: 184),
    Train(id: 4, name: "IC", capacity: 468),
]
