// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

//foreign let a : Range<Int32>
foreign var b = 1..10

foreign{
    //var c : Range<Int32>
    let d  = 1..10
}
