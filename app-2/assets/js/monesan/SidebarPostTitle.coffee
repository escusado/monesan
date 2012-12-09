Class('SidebarPostTitle')({
    prototype:
      init: (element, settings) ->
        #settings
        @scrollWrapper = settings.scrollWrapper
        @sizes         = settings.sizes

        #element collection
        @element = element
        
        @title    = @element.find('.title')
        @category = @element.find('.category')
        @date     = @element.find('.date')

        #remove selected if necesary
        @element.removeClass('selected')

        @elementSizes = 
          title:    parseInt @title.css('font-size')
          category: parseInt @category.css('font-size')
          date:     parseInt @date.css('font-size')

        @bindEvents()

      bindEvents: ->
        @scrollWrapper.on 'scroll', =>
          @scrollManager()

      scrollManager: ->
        top = (@scrollWrapper.offset().top+50) - @element.offset().top
        console.log top
        # =console.log top+' < '+@sizes.normal.outerHeight+': '+(top < @sizes.normal.outerHeight)
        
        #set dynamic size
        if top < @sizes.normal.outerHeight and top > @sizes.normal.outerHeight*-1
          #percentage position in between ranges  
          # @sizes.normal.outerHeight = 100%
          # (top)px = X%?
          percentage = 100-( Math.abs( top*100/@sizes.normal.outerHeight ) )

          # #get dynamic sizes based on percentage
          # # difference is sizes
          # # dif  = @sizes.selected.title-@sizes.normal.title
          
          # #from 0 to diff
          # #from percentage% to 100%

          # # from @sizes.normal.title to @sizes.selected.title
          
          # # (percentage)% = Xpx?
          # incrementSize = {
          #   title    : (percentage*(@sizes.selected.title-@sizes.normal.title))/100
          #   category : (percentage*(@sizes.selected.category-@sizes.normal.category))/100
          #   date     : (percentage*(@sizes.selected.date-@sizes.normal.date))/100
          # }

          # @elementSizes.title += incrementSize.title
          # @elementSizes.category += incrementSize.category
          # @elementSizes.date += incrementSize.date

          # #set dynamic sizes
          # @updateSize()
          # console.log 100-Math.abs(percentage), @element
          @element.css('transform', 'scale('+( 1+(percentage/100))+')');

        #set normal size
        else
          #check for title size to double check that the element get its correct size
          # if parseInt( @title.css('font-size') ) isnt @sizes.normal.title
            # @elementSizes = @sizes.normal
            @element.css('transform', 'scale(1)');
            # @updateSize()

      # updateSize: ->
      #   @title.css('font-size', @elementSizes.title)
      #   @category.css('font-size', @elementSizes.category)
      #   @date.css('font-size', @elementSizes.date)

})