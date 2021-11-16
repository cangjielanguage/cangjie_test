// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Test {
    var a: Array<Int32> = @{1,3}
    var b: Array<Array<Int32>>
    init(x: Array<Array<Int32>>){
        b = x
    }
    func f(x: Array<Int32>): Array<Int32> {
        return x
    }
}

func run(): Int64 {
    var arr1: Array<Array<Int32>> = @{@{2,4},@{3,5}}
    var arr2: Array<Int32> = @{5,7}
    var test: Test = Test(arr1)
    var res1: Array<Int32> = test.a
    var res2: Array<Array<Int32>> = test.b
    var res3: Array<Int32> = test.f(arr2)
    if (res1[0] == 1 && res2[1][0] == 3 && res3[1] ==7) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
