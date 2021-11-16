package p1

external interface WriteStream{
    func write(x:String):Int64{
        write(x,1)
    }
    func write(x:String,y:Int64):Int64
}

external interface StreamPermission{
    func canRead(): Bool{true}
}

external class Stream <: StreamPermission & WriteStream{
    func write(x:String,y:Int64):Int64{
        2
    }
}