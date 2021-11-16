// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = try{1}finally{1}..try{10}finally{10}:try{1}finally{1} 
    let b = 1..10:1
    if(a == b){
        return 0
    }
    return 1
}
