// EXEC: %compiler -frontend -no-prelude %f
// EXEC: ls %n.bc

func run(): Int64 {
    var value : Int32 = 2
    if (value != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
