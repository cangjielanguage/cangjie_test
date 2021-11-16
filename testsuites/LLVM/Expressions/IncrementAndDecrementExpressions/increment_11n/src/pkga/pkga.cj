// DEPENDENCE: ../../src ../../cfg-astb
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o ./pkgb.%middle
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj  ./pkgb.%middle -o ./pkga.%middle 2>&1  | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package pkga
import pkgb.*

func foo(){
    pkgb.x++
    pkgb.y++
    pkgb.z++ // EXPECTED: regex error.*?'z' is not a member of package 'pkgb'
}
