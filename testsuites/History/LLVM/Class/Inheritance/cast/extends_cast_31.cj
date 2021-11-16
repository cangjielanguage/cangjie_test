// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res : Inday = Data()
    if ( res.x != 4 ) { // EXPECTED: regex object cannot access static member 'x'
        return 1
    }
    return 0
}

interface  Inday {
    let x: Int32 = 3
}

class Data <: Inday {
    let x: Int32 = 4
}


