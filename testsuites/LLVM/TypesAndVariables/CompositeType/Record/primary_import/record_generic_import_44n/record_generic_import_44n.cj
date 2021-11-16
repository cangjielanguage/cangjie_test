// DEPENDENCE: pkgs pkga cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle pkga.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

import pkgs.Data
import pkga.Data

func main(): Int32 {
    return run()
}
func run(): Int32 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Data<Int32> = Data<Int32>(a, b)  // EXPECTED: regex there occurs type ambiguity about .*decl .*decl on imported declaration 'Data'
    let data2: Int32 = Data // EXPECTED: regex there occurs type ambiguity about .*decl .*decl on imported declaration 'Data'
    return 0
}

