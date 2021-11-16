// EXEC: %compiler %cmp_opt -backend-options="-L/root/code/Char/output/bin/../lib,-lxxx,-lcangjie-basert,--rtlib=compiler-rt" %f
// EXEC: %ls %n 2>&1 | compare %f
// ASSERT: scan driver_backend_11

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
