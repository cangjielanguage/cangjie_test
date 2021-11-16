// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
foreign interface A{}

foreign let a : A
foreign var b : A 

foreign{
    var c : A
    let d : A 
}