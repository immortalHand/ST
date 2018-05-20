var jq = jQuery.noConflict();
//快讯自动向上移动动画
jq(function(){
	
    function movedown(){
        var marginTop = 0 ;
        var stop =false;
        var interval = setInterval(function(){
            if(stop) return;
            jq('#express').children('li').first().animate({
                    'margin-top':marginTop--},
                0,
                function(){
                    var jqfirst =jq(this);
                    if(!jqfirst.is(':animated')){
                        if((-marginTop)>jqfirst.height()){
                            jqfirst.css({'margin-top':0}).appendTo(jq('#express'));
                            marginTop = 0;
                        }
                    }
                });
        },50);
        jq('#express').mouseover(function(){
            stop = true;
        }).mouseout(function(){
            stop = false;
        });
    }
    movedown();
});