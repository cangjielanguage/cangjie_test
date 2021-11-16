// DEPENDENCE: moudle013 ../cfg-ast
// EXEC: %compiler %cmp_opt -c moudle013/src/pkgs/pkgs.cj -o pkgs.%middle 
// EXEC: %compiler %cmp_opt -c %f  pkgs.%middle -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto illegal object in toplevel

fron "moudle013" import pkgs

func main(): Int64 {
    let a = pkgs.one
    let b = pkgs.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
