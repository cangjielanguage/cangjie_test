// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

extend Int32 < // EXPECTED: regex expected '{' here
	func plus(a: Int32): Int32 { 0 } 
>
    
func main(): Int64 {
    return 0
}