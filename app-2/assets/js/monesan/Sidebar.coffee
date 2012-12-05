Class('Sidebar')({
    setup: (element) ->
        #element collection
        @element = element

        @bindEvents()

    bindEvents: ->
        @element.mousewheel (ev) =>
            @manageScroll(ev)

    manageScroll: (ev) ->


})