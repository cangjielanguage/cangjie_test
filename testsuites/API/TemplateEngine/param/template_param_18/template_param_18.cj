//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.tpl %f 2>&1 |compare %f
//ASSERT: scan IllegalArgumentException The param name cannot be empty!
