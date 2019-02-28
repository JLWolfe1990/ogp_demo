$(document).ready(function() {
  this.showCallback = function(ogp_json) {
    // variable in ruby syntax because of the structure of the passed keys
    this.dropInImage(new Ogp(ogp_json));
  }.bind(this);

  this.dropInImage = function (ogp) {
    // I would have enjoyed to add a spinner here, but I'm going to take that as out of scope
    $('.js-card-title-dropzone').html(ogp.getTitle());
    $('.js-ogp-card-dropzone img').attr({ 'src': ogp.getImageUrl() });
    // todo: listen to the height attribute change and then show the image

    // todo: having a problem with the show() function
    $('.js-ogp-card-dropzone').css('visibility', 'visible');
  };

  this.onSubmitForm =  function(e) {
    e.preventDefault();

    var url = $(e.target).attr('action'); // yields the post path from the form helper
    var data = $(e.target).serializeArray();

    $.post(url, data).done(this.processCreateJson)
  };

  this.processCreateJson = function(ogp_json) {
      // variable in ruby syntax because of the structure of the passed keys
      var ogp = new Ogp(ogp_json);
      this.dropInImage(ogp);

      $('.js-ogp-form input[type=submit]').attr({ disabled: false });
  };

  this.processEvent = function(data) {
      var event_object = new EventPipelineObject(data);

      event_object.doGetShow().done(this.showCallback)
    };


  _.bindAll(this, 'dropInImage', 'onSubmitForm', 'processCreateJson', 'processEvent');

  this.eventManager = new EventManager();
  this.eventManager.bindEvent('ogp-event', this.processEvent);

  // todo: only works a couple of times ??
  $('.js-ogp-form').on('submit', this.onSubmitForm);
});