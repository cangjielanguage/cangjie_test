// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


import pkgs.Data // EXPECTED: regex 'Data' is not accessible in package 'pkgs'

func main(): Int64 {
    return run()
}
func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data<Int32>= Data<Int32>(a, b)
    res = data.area()
    if (res == 3){
        return 0
    }
    return 1
}

