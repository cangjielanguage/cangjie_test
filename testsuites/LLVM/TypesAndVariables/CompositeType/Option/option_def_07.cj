// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var res: Int32 = match (Foo().opt) {
        case Some(x) => x
        case $None => 0
    }
    if (res == 0){
        return 0
    }
    return 1
}

class Foo {
    var opt: Option<Int32> = None<Int32>
}

func main(): Int64 {
    return run()
}

