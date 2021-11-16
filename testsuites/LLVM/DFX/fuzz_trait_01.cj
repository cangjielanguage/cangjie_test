// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

123xx trait X { // EXPECTED: regex illegal object in toplevel
    func asFunc(input:This, input_b:This):This
}
append Bool with X{
    func asFunc(input:Bool,input_b:Bool):Bool{input}
}

func main(): Int64 {
    (true~>true) // EXPECTED: regex type check of flow expression fails
    return 0
}