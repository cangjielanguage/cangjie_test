// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex item: 5
// ASSERT: regex item: 6
// ASSERT: regex item: 7

class Test {
    var a: Set<Int32> = #{5, 6, 7, 5}
    var b: Set<Int32>
    init(x: Set<Int32>){
        b = x
    }
    func f(x: Set<Int32>): Set<Int32>{
        return x
    }
}

func run(): Int64 {
    var setOne: Set<Int32> = #{5, 6, 7, 5}
    var test: Test = Test(setOne)
    var res1: Set<Int32> = test.a
    var res2: Set<Int32> = test.b
    var res3: Set<Int32> = test.f(setOne)
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
