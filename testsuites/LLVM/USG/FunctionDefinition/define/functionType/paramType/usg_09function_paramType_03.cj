// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check the order of the parameter
func a(b!:Int64, x:Int64){ //EXPECTED: regex named parameters must be listed behind all non-named parameters
    return x
}

func main(){
    let a = a(b: 0, 1) 
    return 0
}