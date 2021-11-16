// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait StringTrait {
    func compare(a: This, b: This): This
}

append String with StringTrait {
    func compare(a: String, b:String): String {
        if (a==b){
            return a
        } else {
            return a + b
        }
    }
}

var str1 = "Hello Char"
var str2 = "Hello Char"
var str3 = " Lang"

func run(): Int64 {
    var res1: String = compare(str1, str2)
    var res2: String = compare(str2, str3)
    if (res1 == "Hello Char" && res2 == "Hello Char Lang") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}