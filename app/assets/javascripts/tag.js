

a = $("div.control-group").children();
for( b of a) {
  console.log($(b).children().attr('id'));
  console.log($(b)[0].control.checked);
}
