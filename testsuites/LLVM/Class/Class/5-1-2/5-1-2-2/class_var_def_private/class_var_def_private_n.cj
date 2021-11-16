// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt pkg.cj %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-auto can not access field 'a'

package class_var_def_private

func run(): Int64 {
    var data : Data = Data()
    var test : Int32 = data.a
    if ( test != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
