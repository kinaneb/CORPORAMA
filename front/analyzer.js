$(document).ready(function() {
    function analyze() {
        var sirens_occurrences = {};
        var siren_li_elements = {};
        var sirens_occurrences_counter = 0;

        $('li').each(function() {
            var siren = $(this).text().trim();
            if (siren.length === 0) {
                return;
            }
            if(sirens_occurrences[siren]) {
                siren_li_elements[siren].push(this);
                sirens_occurrences[siren]++;
            }
            else {
                siren_li_elements[siren] = [this];
                sirens_occurrences_counter++;
                sirens_occurrences[siren] = 1;
            }
        });
        var unique_siren_counter = 0;
        $.each(sirens_occurrences, function(siren, occurrence) {
            var elements = siren_li_elements[siren];
            if (occurrence === 1) {
                unique_siren_counter++;
                $(elements).addClass('unique');
            } else {
                $(elements).addClass('other');
            }
        });
        console.log('Unique sirens:', unique_siren_counter);
        console.log('Non unique sirens:', sirens_occurrences_counter - unique_siren_counter);
    }
    analyze();
});