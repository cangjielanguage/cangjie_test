// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main():Int64{
    var rge = .. //EXPECTED: regex missing 'start' in range expression
    var rge2 = .. //EXPECTED: regex missing 'stop' in range expression
    var rg2 = ..10 //EXPECTED: regex missing 'start' in range expression
    for (i in rge) {
        print(i.toString())
    }
    return 0
}