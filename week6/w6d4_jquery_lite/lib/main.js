window.$l = arg => {

};

$l.selector = selector => {
  let songs = document.querySelectorAll("ul.songs");
  let songsArray = [];
  songs.forEach( (el) => {
    songsArray.push(el);
  });
};
