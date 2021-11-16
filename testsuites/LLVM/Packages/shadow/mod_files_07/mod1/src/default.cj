// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt -c ./mod1/src/blank.cj -o ./
// EXEC: %ls 2>&1 | compare %f
// ASSERT: scan-not blank.o
// ASSERT: scan-not blank.cjo

func main(): Int64 {
    var a = a1
    var b = a
    return 0
}