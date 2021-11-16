// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %f src/pkgs/pkgs.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto redefinition of declaration 'TimeUnit1'
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package pkgs

enum TimeUnit1<T> {
      Hour(T)
}

func run(): Int64 {
    var time1 = TimeUnit1.Hour(3)
    return 0
}

func main(): Int64 {
    return run()
}
