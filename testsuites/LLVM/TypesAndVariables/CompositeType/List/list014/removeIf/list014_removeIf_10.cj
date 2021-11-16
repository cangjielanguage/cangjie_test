// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(){
    var a = List<Int64>(100000,{i=>i})
    var b = a.removeIf({i=>i>50})

    if (b.size() != 51){    return 1    }

    for (i in b){
        if(i>50){   return 1}
    }
    
    return 0
}