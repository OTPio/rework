import Foundation

public typealias Snowflake = Int64

extension Snowflake {
    public static var offset: Date? = nil
    private static var increment: Int = 0
    
    public static func generate(offset: Date? = nil, workerID: Int = 0, processID: Int = 0, increment: Int = 0) -> Snowflake {
        var timestamp: Double
        if let offset = offset {
            timestamp = Date().timeIntervalSince(offset)
        } else { timestamp = Date().timeIntervalSince1970 }
        timestamp = (timestamp * 1000.0).rounded()
        
        let tst = Int64(timestamp) << 22
        let wor = Int64(workerID) << 17
        let pro = Int64(processID) << 12
        let inc = Int64(increment)
        
        return (tst + wor + pro + inc)
    }
    
    public func fromConfig(workerID: Int = 0, processID: Int = 0) -> Snowflake {
        defer { Snowflake.increment += 1 }
        return Snowflake.generate(offset: Snowflake.offset, workerID: workerID, processID: processID, increment: Snowflake.increment)
    }
}
