$(document).ready(function() {
    function analyze() {
        var sirens_occurrences = {};
        var siren_li_elements = {};
        $('li').each(function() {
            var siren = $(this).text().trim();
            if(undefined === siren_li_elements[siren]) {
                siren_li_elements[siren] = [this];
                sirens_occurrences[siren] = 1;
                $(this).addClass('unique');
            }
            else {
                siren_li_elements[siren].push(this);
                sirens_occurrences[siren]++;
                $(this).addClass('other');
            }
        });
    }
    analyze();
});