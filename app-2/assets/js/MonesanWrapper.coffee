Class('MonesanWrapper')(
    setup : (element) ->
      @element = element

      #set layout
      LayoutManager.setup( element )

      #start sidebar
      Sidebar.setup( element.find('.sidebar') )
)
