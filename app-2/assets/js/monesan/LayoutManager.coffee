Class('LayoutManager')({
    setup: (element) ->
        
        #element collection
        @sidebar = element.find('.sidebar')
        @canvas  = element.find('.canvas')

        #initial layout
        @layout()

        #bind events
        @bindEvents()

    bindEvents: ->
        $(window).smartresize =>
            @layout()

    layout: ->
        #viewport size
        @viewport = {
            h: window.innerHeight 
            w: window.innerWidth
        }

        @sidebar.height( @viewport.h )
})