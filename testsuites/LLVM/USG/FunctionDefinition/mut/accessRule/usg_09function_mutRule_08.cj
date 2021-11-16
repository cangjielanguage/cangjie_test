// EXEC: %compiler %cmp_opt %f -o %output  2>&1 | compare %f

// check call a mut function in another function
interface I {
    mut func f(): Unit {}
    func g(): Unit {
        f() // EXPECTED: regex immutable function 'g' cannot access mutable function 'f'
    }
}

func main() {
    return 0
}