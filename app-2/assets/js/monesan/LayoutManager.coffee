Class('LayoutManager')({
    setup: (element) ->
        
        #element collection
        @sidebar        = {}
        @sidebar.el     = element.find('.sidebar')
        @sidebar.header = element.find('.sidebar .header')
        @sidebar.body   = element.find('.sidebar .body')

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

        @sidebar.el.height    ( @viewport.h )
        @sidebar.body.height  ( @sidebar.el.height() - @sidebar.header.height() )
})