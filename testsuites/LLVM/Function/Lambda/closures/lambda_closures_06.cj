// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    foo1()
    foo2()
    foo3()
    return 0
}

func foo1(a!: Int32 = 1){
    var x1 = {a} 
    var x2 = {a}() 
    var x3 = foo({a}) 
    if ( a == 2 ){
        return {a} 
    } else {
        return foo({a}) 
    }
}

func foo2(a!: Int32 = 1,y1!:()->Int32={a},y2!:()->Int32=foo({a})){ 
    var x1 = {a} 
    var x2 = {a}() 
    var x3 = foo({a}) 
    if ( a == 2 ){
        return {a} 
    }else {
        return foo({a}) 
    }
}

func foo3(a!: Int32 = 1,y1!:()->Int32={a},y2!:()->Int32=foo({a})){ 
    {a} 
}

func foo(x:()->Int32){return x}
func goo(x:Int32){return x}

