system = require "system"
fs = require "fs"

module.exports =
  loadJUMLY: (jumly_code, callback)->
    suffix = "#{system.pid}-#{new Date().getTime()}"

    tmp_html = "./.#{suffix}.html"

    rootdir = fs.workingDirectory

    fs.write tmp_html, """
      <!DOCTYPE HTML>
      <head>
        <link rel="stylesheet" href="http://jumly.tmtk.net/release/jumly.min.css" />
      </head>
      <body>
      </body>
      <script src='http://code.jquery.com/jquery-2.1.0.min.js'></script>
      <script src='http://coffeescript.org/extras/coffee-script.js'></script>
      <script src='http://jumly.tmtk.net/release/jumly.min.js'></script>
      <script type='text/coffeescript'>
        window._jumly_code = '''
#{jumly_code.replace /'''/g, "\\'\\'\\'"}
        '''
      </script>
      """, "w"
    
    page = new WebPage
    page.onConsoleMessage = (msg)-> console.log msg

    page.open tmp_html, ->
      rect = page.evaluate ->
        $src = $("<div>").html window._jumly_code
        JUMLY.eval $src, into:"body"
        diag = $(".diagram")
        box_shadow_dw =  + 8 + 5
        box_shadow_dh =  + 5 #+ 5
        left:diag.offset().left, top:diag.offset().top, width:diag.outerWidth() + box_shadow_dw, height:diag.outerHeight() + box_shadow_dh

      page.viewportSize = rect
      page.clipRect = rect

      fs.remove tmp_html

      callback? page
