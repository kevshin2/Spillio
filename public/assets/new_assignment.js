$(function(){var s=function(){var s=$(this).closest("tr");s.clone().insertAfter(s)},i=function(){$(this).closest("table").find("tr").length>=3&&$(this).closest("tr").remove()};$("#submissions").on("click",".remove-submission",i),$("#submissions").on("click",".add-submission",s)});