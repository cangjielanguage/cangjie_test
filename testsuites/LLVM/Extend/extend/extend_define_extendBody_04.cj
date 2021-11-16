// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

extend Int32 
	func plus(a: Int32): Int32 { 0 } // EXPECTED: regex expected '{' here

    
func main(): Int64 {
    return 0
}