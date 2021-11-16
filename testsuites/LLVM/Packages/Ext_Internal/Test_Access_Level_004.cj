// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

record Date {
        private let Date: Int64 = 5
        private let Date1: Int64 = 6

        public func get_pub_Date(): Int64 {return Date}
        public let pub_modifier: () -> Int64 = get_pub_Date     // EXPECTED: regex 'get_pub_Date' is not allowed to be accessed before all member variables are initialized
        private let pri_modifier: () -> Int64 = get_pub_Date    // EXPECTED: regex 'get_pub_Date' is not allowed to be accessed before all member variables are initialized

        private func get_pri_Date1(): Int64 {return Date1}
        public let pub_modifier1: () -> Int64 = get_pri_Date1   // EXPECTED: regex 'get_pri_Date1' is not allowed to be accessed before all member variables are initialized
        private let pri_modifier1: () -> Int64 = get_pri_Date1  // EXPECTED: regex 'get_pri_Date1' is not allowed to be accessed before all member variables are initialized


}

func main(): Int64 {

    var newRec1:Date = Date()

    if (newRec1.pub_modifier() != 5 || newRec1.pub_modifier1() != 6) {
        return 1
    }

    return 0
}
