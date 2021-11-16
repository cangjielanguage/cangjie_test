// DEPENDENCE: ../../src ../../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt src/pkga/ src/pkgb/ -o ./ 2>&1 | compare %f
// ASSERT: regex are in circular dependencies
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package pkga
import pkgb.*

external var a: Int32 = b

func run(): Int64 {
    var res: Int32 = pkgb.b
    if (  res ==  1) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
