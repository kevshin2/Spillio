$(document).ready(function(){$("select").select2(),$("#student_skill_names").select2({tags:["ruby","rails","java","iOs","android"],tokenSeparators:[","]}),$("select, #student_skill_names").each(function(t,e){"true"==$(e).attr("data_readonly")&&$(e).select2("readonly",!0)})});