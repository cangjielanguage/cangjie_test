

//DEPENDENCE: ./pkgImport_02
// EXEC: %compiler %cmp_opt -c pkgImport_02/pkg02.cj -o pkg02.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkg02.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


import pkgImport_02.*

func main(): Int64 {
    var a=pkgImport_02.A() error: // EXPECTED:regex error.*?'A' is not a member of package 'pkgImport_02'
    return 0
}
