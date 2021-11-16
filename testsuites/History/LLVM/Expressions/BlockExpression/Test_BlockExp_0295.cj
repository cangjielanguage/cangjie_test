// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C1 {
    var data1: Int32 = 1
}

class C2 <: C1 {
    var data2: Int32 = 2
}

class C3 {
    var data3: Int32 = 3
}

func main(): Int64 {

    let x: Int64 = 10
    if x > 10 {
        Object()
    }else{
        C2()
    }


    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace