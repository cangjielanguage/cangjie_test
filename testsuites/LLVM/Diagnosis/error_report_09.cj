// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f


class A {} // EXPECTED: regex 'A' is previously declared here
enum A {Day}

class B<T> {}   // EXPECTED: regex 'B' is previously declared here
class B{}


func main():Int64 {
    return 0
}