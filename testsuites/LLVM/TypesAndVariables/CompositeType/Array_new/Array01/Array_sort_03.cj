// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a1 = Array<String>(["Google", "Apple", "Microsoft"])

a1.sort()

func main(): Int64 {
    
    if(a1[0]=="Apple" && a1[1]=="Google" && a1[2]=="Microsoft"){
        return 0
    }

    return 1
}
