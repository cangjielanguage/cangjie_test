// ERRCHECK: %compiler %cmp_opt %f -o %output
func a(inputa:Bool, inputb:Bool):Int64 {return 2}

// func b():Int64 = a(return 0,return 1)

func b(): Int64 { a(return 0,return 1) } // EXPECTED: regex expression of Nothing type cannot appear here currently


func main(): Int64 {
    return b()
}
