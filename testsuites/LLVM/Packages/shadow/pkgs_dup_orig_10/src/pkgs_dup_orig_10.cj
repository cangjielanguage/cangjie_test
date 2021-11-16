// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test

func test() { return 3}


func run(): Int64 {
    var res1: Int64 = pkgs.test().foo()
    var res2: Int64 = test()
    if (  res1 + res2 ==  5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
