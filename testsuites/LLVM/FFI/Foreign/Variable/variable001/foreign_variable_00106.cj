// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Int64
foreign var b : Int64

foreign{
    let c : Int64
    var d : Int64
}

func main(){
    b = 3
    b = 4
    d = 5
    d = 6
    return 0
}