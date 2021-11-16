// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Date {
        public let pub_modifier : Int64 = 1
        private let pri_modifier: Int64 = 2

        public let pub_date1: Int64 = pub_modifier
        public let pub_date2: Int64 = pri_modifier

        private let pri_date1: Int64 = pub_modifier
        private let pri_date2: Int64 = pri_modifier
}

func main(): Int64 {

    var newRec1 = Date()

    if newRec1.pub_date1 != 1 || newRec=.pub_date2 != 2 {
        return 1
    }
    //print(newRec1.pub_date1.toString() + "\n")
    //print(newRec1.pub_date2.toString() + "\n")

    return 0
}
