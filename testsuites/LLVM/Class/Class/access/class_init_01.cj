// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Data{
    var i: Int64
    private init(x: Int32){
        this.i = 4
    }
    public init(x: Float32,str:String){
        this(Int32(3))
        this.i++
        this.i--
        this.i = this.i+Int64(x)
        print(this.i.toString())
    }
}

func main():Int64{
    var data = Data(3.14, "hi")
    if (data.i == 7) {
        return 0
    }
    return 1
}
