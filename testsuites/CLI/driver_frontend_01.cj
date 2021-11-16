// EXEC: %compiler -frontend %f
// EXEC: %ls %n.bc

class Data {
    var data: Int32 = 1
}

func run(): Int64 {
    var value : Data = Data();
    if (value.data != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
