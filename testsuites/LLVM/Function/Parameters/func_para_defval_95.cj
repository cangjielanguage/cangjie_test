// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Data(3)
    if (res1.x == 25){
        return 0
    }
    return 1
}

class Data <: Base{
    var x: Int32 = 11
    init(x:Int32,y!:Int32 = 4){
        super(3)
        this.x = this.x + x + y + super.base_x
    }
}

open class Base{
    var base_x: Int32 = 1
    var base_y: Int32 = 2
    init(x: Int32, y!: Int32 = 4){
        this()
        this.base_x = x + y
    }
    init(){
    }
}



