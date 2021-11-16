// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main() {
    var e // EXPECTED: regex error.*variable declaration 'e' need at least one of type and initializer
    e.toString()
    0
}
