!function(e){"use strict";e.extend(e.fn.select2.defaults,{formatNoMatches:function(){return"No s'ha trobat cap coincidència"},formatInputTooShort:function(e,t){var n=t-e.length;return"Introduïu "+n+" caràcter"+(1==n?"":"s")+" més"},formatInputTooLong:function(e,t){var n=e.length-t;return"Introduïu "+n+" caràcter"+(1==n?"":"s")+"menys"},formatSelectionTooBig:function(e){return"Només podeu seleccionar "+e+" element"+(1==e?"":"s")},formatLoadMore:function(){return"S'estan carregant més resultats..."},formatSearching:function(){return"S'està cercant..."}})}(jQuery);