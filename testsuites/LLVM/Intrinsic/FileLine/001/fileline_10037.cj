// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{a}

extend A{
    prop let a : String{ //EXPECTED:regex extend member 'a' is not allowed to shadow members of 'Enum-A'
    get(){
        var a = sourceFile()
        return a
    }
    }

    prop let b : Int64{
    get(){
        var a = sourceLine()
        return a
    }
    }
}




func main(){
    var i = a
    let x = a.a
    let y = a.b
    print("main:${x} ${y}\n")
    return 0
}