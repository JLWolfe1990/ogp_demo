function EventPipelineObject(json_attributes) {
  // notice ruby var style to implicitly indicate key format
  this.showPath = json_attributes.show_path; // not meant to be publicly address (no getter)
  this._rawJSON = json_attributes; // I like to save this JIC (notice no getter method though)

  this.doGetShow = function() {
    return $.get(this.showPath);
  }.bind(this);
}
