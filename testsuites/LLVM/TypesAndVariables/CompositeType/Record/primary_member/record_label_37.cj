// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record Data {
    let width3: Int32 = 1
    let length3: Int32 = 2
    var perimeter3: () -> Int32 = {  => 2*(width3 + length3)} // EXPECTED: regex 'width3' is not allowed to be accessed before all member variables are initialized
    Data(x: Int32, y: Int32, z: () -> Int32){
    }
}

func run(): Int64 {
    let a: Int32 = 5
    var b: Int32 = 6
    var c: () -> Int32 = {  => a}
    let data = Data(a, b, c)
    let res = data.perimeter3()
    if (res == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

