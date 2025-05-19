"use strict";

$("[data-checkboxes]").each(function() {
  var me = $(this),
    group = me.data('checkboxes'),
    role = me.data('checkbox-role');

  me.change(function() {
    var all = $('[data-checkboxes="' + group + '"]:not([data-checkbox-role="dad"])'),
      checked = $('[data-checkboxes="' + group + '"]:not([data-checkbox-role="dad"]):checked'),
      dad = $('[data-checkboxes="' + group + '"][data-checkbox-role="dad"]'),
      total = all.length,
      checked_length = checked.length;

    if(role == 'dad') {
      if(me.is(':checked')) {
        all.prop('checked', true);
      }else{
        all.prop('checked', false);
      }
    }else{
      if(checked_length >= total) {
        dad.prop('checked', true);
      }else{
        dad.prop('checked', false);
      }
    }
  });
});

$("#table-1").dataTable({
  "pageLength": 50,
  "lengthMenu": [[25, 50, 100], [25, 50, 100]],
  "order": [[3, "desc"]], // Sort by the 4th column (date_created) DESC
  "columnDefs": [
    { "sortable": false, "targets": [2,3] }, // Optional: Make others unsortable
    {
      "targets": 3, // Hide date_created column
      "visible": false,
      "searchable": false
    }
  ]
});


$("#table-2").dataTable({
  "pageLength": 50,
  "lengthMenu": [[25, 50, 100], [25, 50, 100]],
  "order": [[3, "desc"]], // Sort by the 4th column (date_created) DESC
  "columnDefs": [
    { "sortable": false, "targets": [2,3] }, // Optional: Make others unsortable
    {
      "targets": 3, // Hide date_created column
      "visible": false,
      "searchable": false
    }
  ]
});


