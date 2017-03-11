const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

$(function () {
  $("button.follow-toggle").each( (i, btn) => new FollowToggle(btn, {}));
});
$(function () {
  $("nav.users-search").each( (i, nav) => new UsersSearch(nav, {}));
});
