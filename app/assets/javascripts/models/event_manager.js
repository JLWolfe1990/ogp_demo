function EventManager() {
  this.bindEvent = function(event, callback) {
    window.channel.bind('ogp-event', callback);
  }.bind(this);
}
