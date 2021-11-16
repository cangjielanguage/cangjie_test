// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record MyRecord<T1> {
    init() {}
    static let v: Bool = true
}

func main():Int64 {
    var v: MyRecord<Int64> = MyRecord<Int64>();
    return 0
}
