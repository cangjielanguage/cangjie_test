// DEPENDENCE: module034001 ../cfg-ast
// EXEC: %compiler %cmp_opt -c module034001/src/pkgs034001a/pkgs034001a.cj -o pkgs034001a.%middle
// EXEC: %compiler %cmp_opt -c %f -o %n.%middle 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto when setting alias for imported package, it should be 'as alias.*'


from module034001 import pkgs034001a.* as alias034001

func main(): Int64 {
    let b = alias034001.two
    if (b != 2) {
        return 1
    }
    return 0
}
