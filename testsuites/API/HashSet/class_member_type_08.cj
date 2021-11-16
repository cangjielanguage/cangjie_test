// EXEC: %compiler %stdx_cmp_opt %n.cj -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args 2>&1 | compare %f
// ASSERT: regex item: 5
// ASSERT: regex item: 6
// ASSERT: regex item: 7

from std import collection.*
class Test {
    var a: HashSet<Int32> =HashSet<Int32> ([5, 6, 7, 5])
    var b: HashSet<Int32>
    init(x: HashSet<Int32>){
        b = x
    }
    func f(x: HashSet<Int32>): HashSet<Int32>{
        return x
    }
}

func run(): Int64 {
    var setOne: HashSet<Int32> = HashSet<Int32> ([5, 6, 7, 5])
    var test: Test = Test(setOne)
    var res1: HashSet<Int32> = test.a
    var res2: HashSet<Int32> = test.b
    var res3: HashSet<Int32> = test.f(setOne)
    if (res1 == res2 && res2 == res3){
        for (item in res1.iterator()) {                    // TO DO set.iterator()
            print("item: " + item.toString() + "\n")
        }
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
