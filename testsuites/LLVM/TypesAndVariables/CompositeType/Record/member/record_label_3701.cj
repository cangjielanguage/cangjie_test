// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


record Data {
    let width3: Int32 = 1
    let length3: Int32 = 2
    var perimeter3: () -> Int32 = {  => 2 * (width3 + length3)} // EXPECTED: regex 'width3' is not allowed to be accessed before all member variables are initialized
}

func run(): Int64 {
    let data = Data()
    let res = data.perimeter3()
    if (res == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

