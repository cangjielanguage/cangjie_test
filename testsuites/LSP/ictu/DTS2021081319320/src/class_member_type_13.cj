// EXEC: %ictu -m tests/HLT/LSP/ictu/DTS2021081319320 -a open_file -p default -f %f 2>&1 | compare %f
// ASSERT: regex OPEN_FILE Action on file: class_member_type_13.cj in package 'default' causes '0' errors

class Test {
    var range1: Range<Int64> = 0..5
    var range2: Range<Int64>
    init(x: Range<Int64>) {
        range2 = x
    }
    func f(x: Range<Int64>): Range<Int64>{
        return x
    }
}

func run(): Int64 {
    var res: Int64 = 0
    var arr = RefArray<Int64>([0,1,2,3,4,5,6,7,8,9])
    var rge2 = 0..5
    var test: Test = Test(rge2)
    var range1 = test.range1
    var range2 = test.range2
    var range3 = test.f(rge2)
    for (i in arr[range1]) {
        res = res + i
    }
    if (range1 == range2 && range2 == range3 && res == 10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
