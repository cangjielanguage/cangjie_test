// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
    return run()
}

record Data{
    var a: Int32
    var b: Int32 = a    // EXPECTED: regex variable 'a' is used before initialization
    Data(a: Int32, b: Int32){
    }
}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data: Data = Data(a, b)
    var res: Int32 = data.b
    return 0
}
