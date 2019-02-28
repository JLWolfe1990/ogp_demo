function Ogp(raw_json) {
  this.imageUrl = raw_json.image_url;
  this.title = raw_json.title;
  this._rawJSON = raw_json; // I like to keep this JIC (notice no getter method though)

  this.getImageUrl = function() {
    return this.imageUrl;
  };

  this.getTitle = function() {
    return this.title;
  };
}