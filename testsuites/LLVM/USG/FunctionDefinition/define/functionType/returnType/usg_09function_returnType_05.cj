// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// check the return type for the recursive function

func a(x: Int64){
    if (x > 0) {
        return x + a(x - 1) // EXPECTED: regex invalid binary operator '\+'
    }
    return x
}

func main():Int64{
    let a = a(4)
    return 0
}
