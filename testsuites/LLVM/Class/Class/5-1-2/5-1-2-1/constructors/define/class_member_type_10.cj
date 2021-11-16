// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Float64*String = (3.14, "PIE")
    var b: Float64*String
    init(x: Float64*String){
        b = x
    }
    func f(x: Float64*String): Float64*String{
        return x
    }
}

func run(): Int64 {
    var tup1: Float64*String = (9.8, "g")
    var tup2: Float64*String = (2.71, "e")
    var test: Test = Test(tup1)
    var res1: Float64*String = test.a
    var res2: Float64*String = test.b
    var res3: Float64*String = test.f(tup2)
    if (res1[0] == 3.14 && res1[1] == "PIE" && res2[0] == 9.8 && res2[1] == "g" && res3[0] == 2.71 && res3[1] == "e") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
