// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

class Date {

        private let Date: Int64 = 5
        private let Date1: Int64 = 6
        private let Date2: Int64 = 7

        public func get_pub_Date(): Int64 {return Date}
        public let pub_modifier: () -> Int64 = get_pub_Date         // EXPECTED: regex 'get_pub_Date' is not allowed to be accessed before all member variables are initialized
        private let pri_modifier: () -> Int64 = get_pub_Date        // EXPECTED: regex 'get_pub_Date' is not allowed to be accessed before all member variables are initialized
        protected let pro_modifier: () -> Int64 = get_pub_Date      // EXPECTED: regex 'get_pub_Date' is not allowed to be accessed before all member variables are initialized

        private func get_pri_Date1(): Int64 {return Date1}
        public let pub_modifier1: () -> Int64 = get_pri_Date1       // EXPECTED: regex 'get_pri_Date1' is not allowed to be accessed before all member variables are initialized
        private let pri_modifier1: () -> Int64 = get_pri_Date1      // EXPECTED: regex 'get_pri_Date1' is not allowed to be accessed before all member variables are initialized
        protected let pro_modifier1: () -> Int64 = get_pri_Date1    // EXPECTED: regex 'get_pri_Date1' is not allowed to be accessed before all member variables are initialized

        protected func get_pri_Date2(): Int64 {return Date2}
        public let pub_modifier2: () -> Int64 = get_pri_Date2       // EXPECTED: regex 'get_pri_Date2' is not allowed to be accessed before all member variables are initialized
        private let pri_modifier2: () -> Int64 = get_pri_Date2      // EXPECTED: regex 'get_pri_Date2' is not allowed to be accessed before all member variables are initialized
        protected let pro_modifier2: () -> Int64 = get_pri_Date2    // EXPECTED: regex 'get_pri_Date2' is not allowed to be accessed before all member variables are initialized

}

func main(): Int64 {

    var newClass1 = Date()

    //if (newClass1.pub_modifier() != 5 || newRec1.pub_modifier1() != 6 || newRec1.pub_modifier2() != 7) {
    //    return 1
    //}

    return 0
}
