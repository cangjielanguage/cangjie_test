// ERRCHECK: %compiler %cmp_opt %f -o %output
func a<X,Y>(x:X,y:Y):Int64 {return 2}

// func b():Int64 = a<Bool, Bool>(return 0, return 1)

func b():Int64 { a<Bool, Bool>(return 0, return 1) } // EXPECTED: regex argument type of nothing is not supported


func main(): Int64 {
    return b()
}
