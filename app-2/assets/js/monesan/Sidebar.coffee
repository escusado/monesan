Class('Sidebar')({
    setup: (element) ->
        #element collection
        @element = element

        @scroller = @element.find('.post-titles')
        @scroller.mCustomScrollbar({
          callbacks:
            whileScrolling: =>
              @triggerScrollEvent()
          })

        normalPost = @element.find('.post:not(.selected):eq(0)')
        selectedPost = @element.find('.post.selected')

        #setup element sizes
        postSizes =
          normal:
            outerHeight : normalPost.outerHeight( yes )
            title       : parseInt normalPost.find('.title').css('font-size')
            cat         : parseInt normalPost.find('.category').css('font-size')
            date        : parseInt normalPost.find('.date').css('font-size')
          
          selected:
            title : parseInt selectedPost.find('.title').css('font-size')
            cat   : parseInt selectedPost.find('.category').css('font-size')
            date  : parseInt selectedPost.find('.date').css('font-size')

        #instance posts
        @posts = []
        @element.find('.post').each (i, el) =>
          console.log el
          @posts.push new SidebarPostTitle( $(el), {
              scrollWrapper  : @scroller
              sizes          : postSizes
            })


        # @bindEvents()

    # bindEvents: ->
    #   @scroller.on 'scroll', =>
    #     @scrollManager();

    triggerScrollEvent: () ->
      @scroller.trigger 'scroll'

      
        

})