// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    genericPrint<(Int64)->Int64>({i=>i}) //EXPECTED: regex error.*no matching function declaration for function call 'genericPrint'
    return 0
}

func genericPrint<T>(a: T) where T<: ToString{
    print(a.toString())
}
