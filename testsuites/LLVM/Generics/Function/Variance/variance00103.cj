// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func g<A,B>(a:A):B{
    let b = g<A,B>(a)
    return b
}

func main():Int64{
    return 0
}