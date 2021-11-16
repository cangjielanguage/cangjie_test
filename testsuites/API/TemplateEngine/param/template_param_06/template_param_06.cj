//DEPENDENCE:../%n
//EXEC: %tool_path/engine %n/Mb.tpl  2>&1 |compare %f
// ASSERT: regex-auto IllegalArgumentException The param format in the template is wrong, the line can no longer appear #!
