!function(e){"use strict";e.extend(e.fn.select2.defaults,{formatNoMatches:function(){return"Δεν βρέθηκαν αποτελέσματα"},formatInputTooShort:function(e,t){var n=t-e.length;return"Παρακαλούμε εισάγετε "+n+" περισσότερο"+(1==n?"":"υς")+" χαρακτήρ"+(1==n?"α":"ες")},formatInputTooLong:function(e,t){var n=e.length-t;return"Παρακαλούμε διαγράψτε "+n+" χαρακτήρ"+(1==n?"α":"ες")},formatSelectionTooBig:function(e){return"Μπορείτε να επιλέξετε μόνο "+e+" αντικείμεν"+(1==e?"ο":"α")},formatLoadMore:function(){return"Φόρτωση περισσότερων..."},formatSearching:function(){return"Αναζήτηση..."}})}(jQuery);