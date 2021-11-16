// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


trait RecordTrait {
    func compare(a: This, b: This): This
}

append record with RecordTrait { // EXPECTED: regex expected type
    func compare(a: record, b:record): record {
        return b
    }
}

record Test {
    var x: Int32 = 1
    var y: Int32 = 2
}

func run(): Int64 {
    let test1: Test = Test(1, 2)
    let test2: Test = Test(3, 4)
    let test: Test  = compare(test1, test2)

    let res1: Int32 = test.x
    let res2: Int32 = test.y
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
