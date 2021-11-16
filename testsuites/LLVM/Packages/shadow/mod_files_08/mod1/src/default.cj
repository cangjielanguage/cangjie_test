// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %pkg_opt -c ./mod1/src/p1 -o ./
// EXEC: %ls 2>&1 | compare %f
// ASSERT: scan-begin default.cj
// ASSERT: scan-next mod1
// ASSERT: scan-end

func main(): Int64 {
    var a = a1
    var b = a
    return 0
}
