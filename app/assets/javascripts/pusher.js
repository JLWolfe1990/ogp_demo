$(document).ready(function() {
  window.pusher = new Pusher('541cdc84971f878966f0', {
    cluster: 'us3',
    forceTLS: true
  });

  window.channel = pusher.subscribe('ogp-channel');
});
