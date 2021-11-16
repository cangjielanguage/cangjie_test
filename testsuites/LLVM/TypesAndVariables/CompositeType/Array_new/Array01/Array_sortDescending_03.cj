// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<String>(["Google", "Apple", "Microsoft"])

a1.sortDescending()

func main(): Int64 {
    
    if(a1[0]=="Microsoft" && a1[1]=="Google" && a1[2]=="Apple"){
        return 0
    }

    return 1
}
