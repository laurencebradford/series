Router.configure
  layoutTemplate: "masterLayout"
  routeControllerNameConverter: "camelCase"

Router.map ->
  @route "home",
    path: "/"
  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        Meteor.subscribe 'posts'
        Meteor.subscribe 'favorites'
        Meteor.subscribe 'comments'
        Meteor.subscribe 'attachments'
      ]
    data: ->
      Posts: Posts.find({},{sort: {createdAt: -1}}).fetch()
 
  @route "postList",
    path: "/posts"
    data: ->
      Posts: Posts.findOne({_id: this.params._id});

###
above not working
###    


###
  @route "profile",
    path: "/profile"
    waitOn: ->
      Meteor.subscribe 'profilePictures'
  @route "account",
    path: "/account"
    onStop: ->
      Alert.clear()
  @route "setUserName",
    path: "/setUserName"
    onBeforeAction: ->
      if not Config.username or (Meteor.userId() and Meteor.user().username)
        @redirect '/dashboard'
      @next()
###