//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.tpl %f 2>&1 |compare %f
//ASSERT: scan IllegalArgumentException the param format in the template is wrong!
