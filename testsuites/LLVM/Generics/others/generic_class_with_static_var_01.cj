// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class MyClass<T1> {
    init() {}
    static let v: Bool = true
}

func main():Int64 {
    var v: MyClass<Int64> = MyClass<Int64>();
    return 0
}
