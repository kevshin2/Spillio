$(function(){var t=function(t,i,n){$.ajax({type:"POST",url:"/project/"+i+"/request_from_group/"+t,data:{priority:n},success:function(){return console.log("Yei :)"),!1},error:function(){return console.log("Nai :("),!1}})};$(".btn-group").on("click",".btn-primary",function(){var i=$("#group-id").val(),n=$(this).closest(".list-group-item").attr("id").split("-")[1],o=$(this).find(".btn-priority").data("priority");t(i,n,o)})});