// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != () ) {return 1}
    return 0
}

func case01(){
    let score = 80
    let a = 80
    var result = match (score) {
        case $a => var a = 1
        case _ => ()
    }
    return result
}
