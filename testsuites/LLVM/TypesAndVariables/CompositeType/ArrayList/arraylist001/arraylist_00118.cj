// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    let array7 = @{0,1,2,3,4,5}
    var rge = array7[0..5:-2]
    for (i in rge) {
        print(i.toString())
    }
    return 0
}