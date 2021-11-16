// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a(T)
    static operator func ()(x:T) {0} // EXPECTED: regex modifiers 'static' and 'operator' are conflict in function declaration
}

func main(): Int64 {
    return A.a(1)(1) // EXPECTED: regex-auto no matching function for operator '()' function call
}
