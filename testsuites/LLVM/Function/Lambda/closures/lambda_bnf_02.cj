// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a0 = 1
    var a = case01()
    if ( a[1] != 1 || a[0] != () || a[2] != () ) {
        return 1
    }
    var b = case02()
    if ( b[1] != () || b[0] != () ) {
        return 2
    }
    var c = case03()
    if ( c[1] != 1 || c[0] != 1 ) {
        return 3
    }
    var d = case04()
    if ( d != () ) {
        return 4
    }
    return 0
}

// expressionOrDeclarations is if-else
func case01(){
    var a = { => if(true){  }else {  }}
    var b = { => if(true){ 1 }else { 2 }}
    var e = { => if(true){ 1 }}
    var c = a()
    var d = b()
    var f = e()
    return (c,d,f)
}

// expressionOrDeclarations is while
func case02(){
    let a0 = 0
    var a = { => while(a0>0){ }}
    var b = { => while(a0>0){ 2 }}
    var c = a()
    var d = b()
    return (c,d)
}

// expressionOrDeclarations is match
func case03(){
    let a0 = 0
    var a = { => match { case _ => 1}}
    var b = { => match (a0) { case _ => 1}}
    var c = a()
    var d = b()
    return (c,d)
}

// expressionOrDeclarations is lambda
func case04(){
    let a0 = 0
    var a = { => {} }
    var c = a()()
    return (c)
}


