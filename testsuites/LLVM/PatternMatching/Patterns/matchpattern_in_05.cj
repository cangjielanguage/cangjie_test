// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main():Int64 {
    if ( case01() != "yes" ) {
        return 1
    }
    return 0
}

func case01(){
    func x(input:Int64):Int64{input*2}
    var s: Int64 = 5
    let arr: ArrayList<Int64> = ArrayList<Int64>(s,x)
    let a = 5
    var r1: String = match (a) {
        case in $arr => "no" // EXPECTED: regex-auto unsupported type 'ArrayList' for 'in pattern' in match case.
        case !in $arr => "yes"
        case _ => "default"
    }
    r1
}

