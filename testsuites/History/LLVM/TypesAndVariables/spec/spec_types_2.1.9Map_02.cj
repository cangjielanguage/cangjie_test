// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    let mapSeven = #{1: "A", 2: "B", 3: "C"}  // The type of mapSeven is inferred to be Map<Int64, String>
    for((item,jtem) in mapSeven) {  // The type of item is Int64*String
        print("${item}")
        print("${jtem}")
    }
    return 0
}

