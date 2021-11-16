// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Date {
        public var pub_modifier : Int64 = 1
        private var pri_modifier: Int64 = 2

        public var pub_date1: Int64 = pub_modifier
        public var pub_date2: Int64 = pri_modifier

        private var pri_date1: Int64 = pub_modifier
        private var pri_date2: Int64 = pri_modifier
}

func main(): Int64 {

    var newRec1 = Date()

    if (newRec1.pub_date1 != 1 || newRec1.pub_date2 != 2) {
        return 1
    }
    //print(newRec1.pub_date1.toString() + "\n")
    //print(newRec1.pub_date2.toString() + "\n")

    return 0
}
