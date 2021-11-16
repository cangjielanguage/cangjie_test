// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test

enum Time { test(Int32) }

var foo = Time.test(14)
var res: Int32 = match (foo) {
    case test(x) => 3
}

func run(): Int64 {
    if (res == 3 && test ==4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
