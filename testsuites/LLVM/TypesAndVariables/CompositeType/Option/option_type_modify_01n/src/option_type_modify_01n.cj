// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs.opt     // EXPECTED: regex 'opt' is not accessible in package 'pkgs'

func run(): Int64 {
    var res: String = match (opt) {
        case Some(x) => x
        case $None => ""
    }
    if (res == "option"){
        return 0
    }
    return 1

}

func main(): Int64{
    run()
}
