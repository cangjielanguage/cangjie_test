// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {

    let b = Array<String>(["aa","bb","cc"])
    b.reverse()

    if(b[0]=="cc" && b[1]== "bb" && b[2]== "aa" ){
      return 0
    } 

    return 2
}
