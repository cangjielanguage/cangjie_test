// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait OptionTrait<T> {
    func compare(a: Option<T>, b: This): This
}

append Option<Int32> with OptionTrait<Int32> {
    func compare(a: Option<Int32>, b: Option<Int32>): Option<Int32> {
        return b
    }
}

func run(): Int64 {
    var opt: Option<Int32> = compare(Option<Int32>.None, Option<Int32>.Some(4))
    var res: Int32 = match (opt) {
        case Some(x) => x
        case $None => -1
    }
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}