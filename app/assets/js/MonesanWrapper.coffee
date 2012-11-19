Class('MonesanWrapper')(
  prototype :
    init : (element) ->
      @element = element

      @header  = @element.find('section.header');
      @sidebar = @element.find('section.sidebar');

      @setLayout();

    setLayout: ->
      winH = $(document).height();
      @sidebar.height( winH - @header.height() )
)
