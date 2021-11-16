// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


class Coo<T> {
    static operator func ==<V>(right:V):Bool { // EXPECTED: regex error.*?modifiers 'static' and 'operator' are conflict in function declaration
        return true
    }

}

func main(): Int64 {
    return 0
}