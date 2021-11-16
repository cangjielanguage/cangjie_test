// EXEC: mkdir abc
// EXEC: %compiler %cmp_opt %f -o abc/a.out
// EXEC: %run %run_opt abc/a.out

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
