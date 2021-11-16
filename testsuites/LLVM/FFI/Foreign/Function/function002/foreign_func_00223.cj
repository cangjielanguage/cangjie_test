// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:(Int32,Int32)->Int32):(Int32, Int32)->Int32

foreign {
    func bar(a:(Int32, Int32)->Int32):(Int32, Int32)->Int32
}
