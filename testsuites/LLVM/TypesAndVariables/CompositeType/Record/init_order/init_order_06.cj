// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

var c:Float32 = 0.0

record Data {
    var a : Int32  = 100
    var b : Float32 = 200.0
    init()  {
        a = 200
        b = 300.0
    }

    init(a: Int32 , b!:Float32 = {c = 10.0; c}())  {
        this()
        if((this.a == 200) && (this.b == 300.0)){
            this.a = a
            this.b = b
        }
    }
}

func run(): Int64 {
    var value : Data = Data(5)
    if((value.a == 5) && (value.b == 10.0)){
        return 0
    }
    else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
