const APIUtil = require('./api_util');

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = (this.$el.data("initial-follow-state") ||
                        options.followState);
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  handleClick(e) {
    const followToggle = this;
    e.preventDefault();

    if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => {
        followToggle.followState = "unfollowed";
        followToggle.render();
      });
    } else if (this.followState === "unfollowed") {
      this.followState = "following";
      this.render();
      APIUtil.followUser(this.userId).then(() => {
        followToggle.followState = "followed";
        followToggle.render();
      });
    }
  }

  render() {
    if (this.followState === "followed") {
      this.$el.prop("disabled", false);
      this.$el.text("Unfollow!");
    } else if (this.followState === "unfollowed") {
      this.$el.prop("disabled", false);
      this.$el.text("Follow!");
    } else if (this.followState === "following") {
      this.$el.prop("disabled", true);
      this.$el.text("Following...");
    } else if (this.followState === "unfollowing") {
      this.$el.prop("disabled", true);
      this.$el.text("Unfollowing...");
    }
  }
}

module.exports = FollowToggle;
