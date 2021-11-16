// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var x1:Father = Father(3)
    var x2:Son = Son(3)
    var x3:Father = Son(3)
    var res1 = Data(x:x1)
    var res2 = Data(x2)
    var res3 = Data(x:x3)
    print(res3.x.fv.toString()+"\n")
    if ( res1.x.fv == 7 && res2.x.fv == 4 && res3.x.fv == 104){
        return 0
    }
    return 1
}


class Data{
    var x: Father = Father(1)
    var z: Son = Son(1)
    var y: Int32 = 2
    init(x!:Father,y!:Int32 = 4){
        this()
        this.x = Father(x.fv+y)
    }
    init(x:Son){
        this()
        this.x = Father(x.sv+1)
    }
    init(){
        print("yes")
    }
}

open class Father{
    var fv: Int32 = 100
    init() {}
    init(v:Int32){
        this.fv  = v
    }
}
class Son <: Father{
    var sv: Int32 = 10
    init(v:Int32){
        super()
        this.sv = v
    }
}

