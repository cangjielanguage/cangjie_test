// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Map<Int32,Int32>
foreign var b : Map<Int32,Int32> = #{1:1}

foreign{
    var c : Map<Int32,Int32>
    let d : Map<Int32,Int32> = #{1:1}
}
