// EXEC:%compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output | compare %f

func main() {
    var a: Int64 = 1
    let l: Bool = true
    while (l) {
        a++
    }
    return a
}
// DEPENDENCE: ../parseDebugInfo.py 023_debug_stop_expected.txt
// EXEC: %compiler %cmp_opt %dumpCHILDebug -g %n.cj -o %output > actual.txt
// EXEC: python parseDebugInfo.py --a actual.txt --e 023_debug_stop_expected.txt

// ASSERT:scan  6: jmp
// ASSERT:scan-not  8:

