


let getId = () => {
  let a = $("div.control-group").children();
  let tab = new Array;
  let count = 0;
  for( b of a; count++) {
    tab[count] = new Array;
    tab[count].push($(b).children().attr('id'));
    tab[count].push($(b)[0].control.checked);
  }
}



