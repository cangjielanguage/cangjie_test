// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : (Int32, Int32)->Int32
var b : (Int32, Int32)->Int32 = { a:Int32,b:Int32 => a}

foreign{
    var c : (Int32, Int32)->Int32
    let d : (Int32, Int32)->Int32 = { a:Int32,b:Int32 => a}
}
