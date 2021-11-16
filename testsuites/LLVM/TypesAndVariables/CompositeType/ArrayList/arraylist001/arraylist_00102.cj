// ERRCHECK: %compiler %cmp_opt %f -o %output

func main(): Int64 {
    var myArray : ArrayList<Int64> = ArrayList<Int64>([].toArray()) // EXPECTED: regex no matching constructor for call 'ArrayList'
    return 0
}
