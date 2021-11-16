// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var index: Int64 = 0
    for (i in 0..5) {
        index = i 
        while (index < 20) {
            index = index + 1
            if ((index % 4 == 0) && (index % 6 == 0)) {
                print("$(index) is divisible by both 4 and 6")  // output: 12
                break
            }
        }
        print("$(i)th test")
    }
    return 0  
}



