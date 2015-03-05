$( document ).ready(function() {

  $( '#fetch-post' ).on('click', function(e) {
    e.preventDefault();

    $.ajax({
      url: '/reddit',
      type: 'get',
      data: {'someparam': 'stuff'},
      success: function(result) {
        var hydratedThing = new RedditPost(result);
        console.log(hydratedThing.title);
      }
    });
  });

  function RedditPost(params) {
    this.title = params['title'];
    this.user = params['username'];
    this.content = params['content'];
    this.url = params['url'];
    this.votes = params['votes'];
  };

  RedditPost.prototype.upVote = function() {
    this.votes++
    return this.votes
  };

  RedditPost.prototype.downVote = function() {
    this.votes--
    return this.votes
  };
});

