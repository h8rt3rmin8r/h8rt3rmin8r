<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
  

  


  

  <head>
    <title>
      /seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js – Seattle
    </title>
        <link rel="search" href="/search" />
        <link rel="help" href="/wiki/TracGuide" />
        <link rel="alternate" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js?format=txt" type="text/plain" title="Plain Text" /><link rel="alternate" href="/export/7591/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js" type="application/javascript; charset=iso-8859-15" title="Original Format" />
        <link rel="up" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace" title="Parent directory" />
        <link rel="start" href="/wiki" />
        <link rel="stylesheet" href="/chrome/common/css/trac.css" type="text/css" /><link rel="stylesheet" href="/chrome/common/css/code.css" type="text/css" /><link rel="stylesheet" href="/chrome/common/css/browser.css" type="text/css" /><link rel="stylesheet" href="/chrome/theme/pydotorg.css" type="text/css" /><link rel="stylesheet" href="/themeengine/theme.css" type="text/css" />
        <link rel="shortcut icon" href="/chrome/common/trac.ico" type="image/x-icon" />
        <link rel="icon" href="/chrome/common/trac.ico" type="image/x-icon" />
      <link type="application/opensearchdescription+xml" rel="search" href="/search/opensearch" title="Search Seattle" />
    <script type="text/javascript" src="/chrome/common/js/jquery.js"></script><script type="text/javascript" src="/chrome/common/js/trac.js"></script><script type="text/javascript" src="/chrome/common/js/search.js"></script>
    <!--[if lt IE 7]>
    <script type="text/javascript" src="/chrome/common/js/ie_pre7_hacks.js"></script>
    <![endif]-->
    <script type="text/javascript">
      jQuery(document).ready(function($) {
        $(".trac-toggledeleted").show().click(function() {
                  $(this).siblings().find(".trac-deleted").toggle();
                  return false;
        }).click();
        $("#jumploc input").hide();
        $("#jumploc select").change(function () {
          this.parentNode.parentNode.submit();
        });
      });
    </script>
  </head>
  <body>
    <div id="banner">
      <div id="header">
        <a id="logo" href="/"><img src="/chrome/site/seattle.png" alt="Seattle" height="70" /></a>
      </div>
      <form id="search" action="/search" method="get">
        <div>
          <label for="proj-search">Search:</label>
          <input type="text" id="proj-search" name="q" size="18" value="" />
          <input type="submit" value="Search" />
        </div>
      </form>
      <div id="metanav" class="nav">
    <ul>
      <li class="first"><a href="/login">Login</a></li><li class="last"><a href="/prefs">Preferences</a></li>
    </ul>
  </div>
    </div>
    <div id="mainnav" class="nav">
    <ul>
      <li class="first"><a href="/wiki">Home</a></li><li><a href="/wiki/ProgrammersPage">Programmer Portal</a></li><li><a href="/wiki/EducatorsPage">Educator Portal</a></li><li><a href="/wiki/ContributorsPage">Contributor Portal</a></li><li><a href="/timeline">Timeline</a></li><li><a href="/roadmap">Roadmap</a></li><li class="active"><a href="/browser">Browse Source</a></li><li><a href="/report">View Tickets</a></li><li class="last"><a href="/blog">Blog</a></li>
    </ul>
  </div>
    <div id="main">
      <div id="ctxtnav" class="nav">
        <h2>Context Navigation</h2>
          <ul>
              <li class="first"><a href="/changeset/4865/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js">Last Change</a></li><li><a href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js?annotate=blame&amp;rev=4865" title="Annotate each line with the last changed revision (this can be time consuming...)">Annotate</a></li><li class="last"><a href="/log/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js">Revision Log</a></li>
          </ul>
        <hr />
      </div>
    <div id="content" class="browser">
      <h1>
        <p><font size="3" color="red"><b>Please note that the CVS and issue trackers have moved to <a href="https://github.com/SeattleTestbed">GitHub</a>. These Trac pages are no longer kept up-to-date.</b></font></p>
        <a class="pathentry first" title="Go to root directory" href="/browser">root</a><span class="pathentry sep">/</span><a class="pathentry" title="View seattle" href="/browser/seattle">seattle</a><span class="pathentry sep">/</span><a class="pathentry" title="View trunk" href="/browser/seattle/trunk">trunk</a><span class="pathentry sep">/</span><a class="pathentry" title="View repy" href="/browser/seattle/trunk/repy">repy</a><span class="pathentry sep">/</span><a class="pathentry" title="View apps" href="/browser/seattle/trunk/repy/apps">apps</a><span class="pathentry sep">/</span><a class="pathentry" title="View tryrepy" href="/browser/seattle/trunk/repy/apps/tryrepy">tryrepy</a><span class="pathentry sep">/</span><a class="pathentry" title="View web" href="/browser/seattle/trunk/repy/apps/tryrepy/web">web</a><span class="pathentry sep">/</span><a class="pathentry" title="View js" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js">js</a><span class="pathentry sep">/</span><a class="pathentry" title="View ace" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace">ace</a><span class="pathentry sep">/</span><a class="pathentry" title="View mode-python.js" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js">mode-python.js</a><br style="clear: both" />
        </h1>
      <div id="jumprev">
        <form action="" method="get">
          <div>
            <label for="rev">
              View revision:</label>
            <input type="text" id="rev" name="rev" size="6" />
          </div>
        </form>
      </div>
      <table id="info" summary="Revision info">
        <tr>
          <th scope="col">
            Revision <a href="/changeset/4865">4865</a>, <span title="4511 bytes">4.4 KB</span>
            (checked in by albert, <a class="timeline" href="/timeline?from=2011-10-24T06%3A41%3A12-0700&amp;precision=second" title="2011-10-24T06:41:12-0700 in Timeline">6 years</a> ago)
          </th>
        </tr>
        <tr>
          <td class="message searchable">
              <p>
First commit of Lukas Puehringer's 'Try Repy' web-based IDE<br />
</p>
          </td>
        </tr>
      </table>
      <div id="preview" class="searchable">
    <table class="code"><thead><tr><th class="lineno" title="Line numbers">Line</th><th class="content"> </th></tr></thead><tbody><tr><th id="L1"><a href="#L1">1</a></th><td>define("ace/mode/python",["require","exports","module","pilot/oop","ace/mode/text","ace/tokenizer","ace/mode/python_highlight_rules","ace/mode/matching_brace_outdent","ace/range"],function(a,b,c){var d=a("pilot/oop"),e=a("ace/mode/text").Mode,f=a("ace/tokenizer").Tokenizer,g=a("ace/mode/python_highlight_rules").PythonHighlightRules,h=a("ace/mode/matching_brace_outdent").MatchingBraceOutdent,i=a("ace/range").Range,j=function(){this.$tokenizer=new f((new g).getRules()),this.$outdent=new h};d.inherits(j,e),function(){this.toggleCommentLines=function(a,b,c,d){var e=!0,f=[],g=/^(\s*)#/;for(var h=c;h&lt;=d;h++)if(!g.test(b.getLine(h))){e=!1;break}if(e){var j=new i(0,0,0,0);for(var h=c;h&lt;=d;h++){var k=b.getLine(h),l=k.match(g);j.start.row=h,j.end.row=h,j.end.column=l[0].length,b.replace(j,l[1])}}else b.indentRows(c,d,"#")},this.getNextLineIndent=function(a,b,c){var d=this.$getIndent(b),e=this.$tokenizer.getLineTokens(b,a),f=e.tokens,g=e.state;if(f.length&amp;&amp;f[f.length-1].type=="comment")return d;if(a=="start"){var h=b.match(/^.*[\{\(\[\:]\s*$/);h&amp;&amp;(d+=c)}return d},this.checkOutdent=function(a,b,c){return this.$outdent.checkOutdent(b,c)},this.autoOutdent=function(a,b,c){this.$outdent.autoOutdent(b,c)}}.call(j.prototype),b.Mode=j}),define("ace/mode/python_highlight_rules",["require","exports","module","pilot/oop","pilot/lang","ace/mode/text_highlight_rules"],function(a,b,c){var d=a("pilot/oop"),e=a("pilot/lang"),f=a("ace/mode/text_highlight_rules").TextHighlightRules,g=function(){var a=e.arrayToMap("and|as|assert|break|class|continue|def|del|elif|else|except|exec|finally|for|from|global|if|import|in|is|lambda|not|or|pass|print|raise|return|try|while|with|yield".split("|")),b=e.arrayToMap("True|False|None|NotImplemented|Ellipsis|__debug__".split("|")),c=e.arrayToMap("abs|divmod|input|open|staticmethod|all|enumerate|int|ord|str|any|eval|isinstance|pow|sum|basestring|execfile|issubclass|print|super|binfile|iter|property|tuple|bool|filter|len|range|type|bytearray|float|list|raw_input|unichr|callable|format|locals|reduce|unicode|chr|frozenset|long|reload|vars|classmethod|getattr|map|repr|xrange|cmp|globals|max|reversed|zip|compile|hasattr|memoryview|round|__import__|complex|hash|min|set|apply|delattr|help|next|setattr|buffer|dict|hex|object|slice|coerce|dir|id|oct|sorted|intern".split("|")),d=e.arrayToMap("".split("|")),f="(?:r|u|ur|R|U|UR|Ur|uR)?",g="(?:(?:[1-9]\\d*)|(?:0))",h="(?:0[oO]?[0-7]+)",i="(?:0[xX][\\dA-Fa-f]+)",j="(?:0[bB][01]+)",k="(?:"+g+"|"+h+"|"+i+"|"+j+")",l="(?:[eE][+-]?\\d+)",m="(?:\\.\\d+)",n="(?:\\d+)",o="(?:(?:"+n+"?"+m+")|(?:"+n+"\\.))",p="(?:(?:"+o+"|"+n+")"+l+")",q="(?:"+p+"|"+o+")";this.$rules={start:[{token:"comment",regex:"#.*$"},{token:"string",regex:f+'"{3}(?:[^\\\\]|\\\\.)*?"{3}'},{token:"string",merge:!0,regex:f+'"{3}.*$',next:"qqstring"},{token:"string",regex:f+'"(?:[^\\\\]|\\\\.)*?"'},{token:"string",regex:f+"'{3}(?:[^\\\\]|\\\\.)*?'{3}"},{token:"string",merge:!0,regex:f+"'{3}.*$",next:"qstring"},{token:"string",regex:f+"'(?:[^\\\\]|\\\\.)*?'"},{token:"constant.numeric",regex:"(?:"+q+"|\\d+)[jJ]\\b"},{token:"constant.numeric",regex:q},{token:"constant.numeric",regex:k+"[lL]\\b"},{token:"constant.numeric",regex:k+"\\b"},{token:function(e){return a.hasOwnProperty(e)?"keyword":b.hasOwnProperty(e)?"constant.language":d.hasOwnProperty(e)?"invalid.illegal":c.hasOwnProperty(e)?"support.function":e=="debugger"?"invalid.deprecated":"identifier"},regex:"[a-zA-Z_$][a-zA-Z0-9_$]*\\b"},{token:"keyword.operator",regex:"\\+|\\-|\\*|\\*\\*|\\/|\\/\\/|%|&lt;&lt;|&gt;&gt;|&amp;|\\||\\^|~|&lt;|&gt;|&lt;=|=&gt;|==|!=|&lt;&gt;|="},{token:"lparen",regex:"[\\[\\(\\{]"},{token:"rparen",regex:"[\\]\\)\\}]"},{token:"text",regex:"\\s+"}],qqstring:[{token:"string",regex:'(?:[^\\\\]|\\\\.)*?"{3}',next:"start"},{token:"string",merge:!0,regex:".+"}],qstring:[{token:"string",regex:"(?:[^\\\\]|\\\\.)*?'{3}",next:"start"},{token:"string",merge:!0,regex:".+"}]}};d.inherits(g,f),b.PythonHighlightRules=g}),define("ace/mode/matching_brace_outdent",["require","exports","module","ace/range"],function(a,b,c){var d=a("ace/range").Range,e=function(){};(function(){this.checkOutdent=function(a,b){return/^\s+$/.test(a)?/^\s*\}/.test(b):!1},this.autoOutdent=function(a,b){var c=a.getLine(b),e=c.match(/^(\s*\})/);if(!e)return 0;var f=e[1].length,g=a.findMatchingBracket({row:b,column:f});if(!g||g.row==b)return 0;var h=this.$getIndent(a.getLine(g.row));a.replace(new d(b,0,b,f-1),h)},this.$getIndent=function(a){var b=a.match(/^(\s+)/);return b?b[1]:""}}).call(e.prototype),b.MatchingBraceOutdent=e})</td></tr></tbody></table>
      </div>
      <div id="help">
        <strong>Note:</strong> See <a href="/wiki/TracBrowser">TracBrowser</a>
        for help on using the browser.
      </div>
      <div id="anydiff">
        <form action="/diff" method="get">
          <div class="buttons">
            <input type="hidden" name="new_path" value="/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js" />
            <input type="hidden" name="old_path" value="/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js" />
            <input type="hidden" name="new_rev" />
            <input type="hidden" name="old_rev" />
            <input type="submit" value="View changes..." title="Select paths and revs for Diff" />
          </div>
        </form>
      </div>
    </div>
    <div id="altlinks">
      <h3>Download in other formats:</h3>
      <ul>
        <li class="first">
          <a rel="nofollow" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js?format=txt">Plain Text</a>
        </li><li class="last">
          <a rel="nofollow" href="/export/7591/seattle/trunk/repy/apps/tryrepy/web/js/ace/mode-python.js">Original Format</a>
        </li>
      </ul>
    </div>
    </div>
    <div id="footer" lang="en" xml:lang="en"><hr />
      <a id="tracpowered" href="http://trac.edgewall.org/"><img src="/chrome/common/trac_logo_mini.png" height="30" width="107" alt="Trac Powered" /></a>
      <p class="left">
        Powered by <a href="/about"><strong>Trac 0.11.6</strong></a><br />
        By <a href="http://www.edgewall.org/">Edgewall Software</a>.
      </p>
      <p class="right"><p><table><tr><td>This material is based upon work supported by the National Science Foundation under Grant No.s (0834243, 1205415, and 1223588). Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of GPO Technologies, Corp., the GENI Project Office, or the National Science Foundation.</td></tr></table> </p></p>
    </div>
  
<!-- Google Analytics Widget Code -->
<script type="text/javascript">
  var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
  document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
  try {
    jQuery(document).ready( function() {
      var pageTracker = _gat._getTracker("UA-6429088-1");
      jQuery('a').each( function() {
        var url;
        if ( this.href.match("http:\/\/seattle.poly.edu") ) {
          if ( this.href.match(/\.(zip|tar|tar.gz|tar.bzip|py|repy|txt)$/) ) {
            url = this.pathname + this.search;
          };
        } else {
          var port = '';
          if ( this.port != '') port = ':'+this.port;
          url = '/external/' + this.hostname + port + this.pathname + this.search;
        };
        if ( url ) {
          if ( ! url.match('^\/attachment\/') ) {
            jQuery(this).click( function() {
              pageTracker._trackPageview(url);
            });
          };
        };
      });
    pageTracker._trackPageview();
    });
  } catch(err) {}
</script>
<!-- Google Analytics Widget Code Ended -->
</body>
</html>