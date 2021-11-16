// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E<T>{
|e(T,T)
|e(T,T,T)
|e(T,T,T,T)
}

enum F{
|e(Int64)
|e(Int64,Int64)
}

func main(): Int64 {
    e(true,1) // EXPECTED: regex no matching enum constructor 'e' for given arguments
    return 0
}
