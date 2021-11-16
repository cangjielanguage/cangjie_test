// EXEC: %compiler -backend js -backend-options="" %f
// EXEC: %ls %n 2>&1 | compare %f
// ASSERT: regex driver_backend_18

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var b:Base = Base()
    return 0
}


class Base{
    var a: Int32 = 3
}

