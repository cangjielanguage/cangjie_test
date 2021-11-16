// EXEC: %compiler %cmp_opt %f -o %output  2>&1 | compare %f 

func main(): Int64 {
    var a = 0..5:Float64(2) //EXPECTED: regex step must be int64 in range expression

    return 0;
}
