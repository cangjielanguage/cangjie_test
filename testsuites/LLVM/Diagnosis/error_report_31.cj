// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

class A<T,V> {}
func main() {
    var a : A       // EXPECTED: regex-auto generic type should be used with type argument
    var a2: A<T>    // EXPECTED: regex-auto type argument's number does not match type parameter's number
    return 0
}
