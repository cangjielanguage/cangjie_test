// DEPENDENCE: pkga pkgb
// EXEC: %compiler %cmp_opt -c pkga/a.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c pkgb/*.cj -o pkgb.%middle
// EXEC-PIPE-1: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -o %output 2>&1 | compare %f

//DTS202107020IK11SP1D00
import pkga.* as alias1.*
import pkgb.*
import pkgb.b1 as alias2

func main(): Int64 {
    var m1 = alias1.a // EXPECTED: regex-not error
    var m2 = alias2  // EXPECTED: regex-not error
    var m7 = pkga.a // EXPECTED: regex error.*undeclared identifier 'a'
    var m6 = a // EXPECTED: regex-not error
    var m3 = pkgb.b1 // EXPECTED: regex error.*'b1' is not a member of package 'pkgb'
    var m4 = b1 // EXPECTED: regex error.*undeclared identifier 'b1'
    var m5 = b2  // EXPECTED: regex-not error
    return 0
}
