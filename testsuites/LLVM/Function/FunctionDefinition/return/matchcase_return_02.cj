// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// Nothing express after "=>"
func main():Int64 {
    if ( case01() != () ) {return 1}
    case02()
    if ( case03() != () ) {return 1}
    return 0
}

// match expression return Min-Father Typle of Nothing and Unit
func case01(){
    let score = 80
    let a = 80
    var result = match (score) {
        case $a => return ()
        case _ =>
    }
    return result
}

// match expression return Nothing,cause func return Nothing
func case02(){
    let score = 80
    let a = 80
    var result = match (score) {
        case $a => return 0
        case _ => return 1
    }
    return result
}

// match expression return Nothing,but func renturn Unit
func case03(){
    let score = 80
    let a = 80
    var result = match (score) {
        case $a => return 0
        case _ => return 1
    }
    return
}