// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Set<Int32>
foreign var b : Set<Int32> = #{1}

foreign{
    var c : Set<Int32>
    let d : Set<Int32> = #{1}
}
