<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  
  

  


  

  <head>
    <title>
      /seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js – Seattle
    </title>
        <link rel="search" href="/search" />
        <link rel="help" href="/wiki/TracGuide" />
        <link rel="alternate" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js?format=txt" type="text/plain" title="Plain Text" /><link rel="alternate" href="/export/7591/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js" type="application/javascript; charset=iso-8859-15" title="Original Format" />
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
              <li class="first"><a href="/changeset/4865/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js">Last Change</a></li><li><a href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js?annotate=blame&amp;rev=4865" title="Annotate each line with the last changed revision (this can be time consuming...)">Annotate</a></li><li class="last"><a href="/log/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js">Revision Log</a></li>
          </ul>
        <hr />
      </div>
    <div id="content" class="browser">
      <h1>
        <p><font size="3" color="red"><b>Please note that the CVS and issue trackers have moved to <a href="https://github.com/SeattleTestbed">GitHub</a>. These Trac pages are no longer kept up-to-date.</b></font></p>
        <a class="pathentry first" title="Go to root directory" href="/browser">root</a><span class="pathentry sep">/</span><a class="pathentry" title="View seattle" href="/browser/seattle">seattle</a><span class="pathentry sep">/</span><a class="pathentry" title="View trunk" href="/browser/seattle/trunk">trunk</a><span class="pathentry sep">/</span><a class="pathentry" title="View repy" href="/browser/seattle/trunk/repy">repy</a><span class="pathentry sep">/</span><a class="pathentry" title="View apps" href="/browser/seattle/trunk/repy/apps">apps</a><span class="pathentry sep">/</span><a class="pathentry" title="View tryrepy" href="/browser/seattle/trunk/repy/apps/tryrepy">tryrepy</a><span class="pathentry sep">/</span><a class="pathentry" title="View web" href="/browser/seattle/trunk/repy/apps/tryrepy/web">web</a><span class="pathentry sep">/</span><a class="pathentry" title="View js" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js">js</a><span class="pathentry sep">/</span><a class="pathentry" title="View ace" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace">ace</a><span class="pathentry sep">/</span><a class="pathentry" title="View theme-clouds_midnight.js" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js">theme-clouds_midnight.js</a><br style="clear: both" />
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
            Revision <a href="/changeset/4865">4865</a>, <span title="2729 bytes">2.7 KB</span>
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
    <table class="code"><thead><tr><th class="lineno" title="Line numbers">Line</th><th class="content"> </th></tr></thead><tbody><tr><th id="L1"><a href="#L1">1</a></th><td>define("ace/theme/clouds_midnight",["require","exports","module"],function(a,b,c){var d=a("pilot/dom"),e=".ace-clouds-midnight .ace_editor {\n  border: 2px solid rgb(159, 159, 159);\n}\n\n.ace-clouds-midnight .ace_editor.ace_focus {\n  border: 2px solid #327fbd;\n}\n\n.ace-clouds-midnight .ace_gutter {\n  width: 50px;\n  background: #e8e8e8;\n  color: #333;\n  overflow : hidden;\n}\n\n.ace-clouds-midnight .ace_gutter-layer {\n  width: 100%;\n  text-align: right;\n}\n\n.ace-clouds-midnight .ace_gutter-layer .ace_gutter-cell {\n  padding-right: 6px;\n}\n\n.ace-clouds-midnight .ace_print_margin {\n  width: 1px;\n  background: #e8e8e8;\n}\n\n.ace-clouds-midnight .ace_scroller {\n  background-color: #191919;\n}\n\n.ace-clouds-midnight .ace_text-layer {\n  cursor: text;\n  color: #929292;\n}\n\n.ace-clouds-midnight .ace_cursor {\n  border-left: 2px solid #7DA5DC;\n}\n\n.ace-clouds-midnight .ace_cursor.ace_overwrite {\n  border-left: 0px;\n  border-bottom: 1px solid #7DA5DC;\n}\n \n.ace-clouds-midnight .ace_marker-layer .ace_selection {\n  background: #000000;\n}\n\n.ace-clouds-midnight .ace_marker-layer .ace_step {\n  background: rgb(198, 219, 174);\n}\n\n.ace-clouds-midnight .ace_marker-layer .ace_bracket {\n  margin: -1px 0 0 -1px;\n  border: 1px solid #BFBFBF;\n}\n\n.ace-clouds-midnight .ace_marker-layer .ace_active_line {\n  background: rgba(215, 215, 215, 0.031);\n}\n\n       \n.ace-clouds-midnight .ace_invisible {\n  color: #BFBFBF;\n}\n\n.ace-clouds-midnight .ace_keyword {\n  color:#927C5D;\n}\n\n.ace-clouds-midnight .ace_keyword.ace_operator {\n  color:#4B4B4B;\n}\n\n.ace-clouds-midnight .ace_constant {\n  \n}\n\n.ace-clouds-midnight .ace_constant.ace_language {\n  color:#39946A;\n}\n\n.ace-clouds-midnight .ace_constant.ace_library {\n  \n}\n\n.ace-clouds-midnight .ace_constant.ace_numeric {\n  color:#46A609;\n}\n\n.ace-clouds-midnight .ace_invalid {\n  color:#FFFFFF;\nbackground-color:#E92E2E;\n}\n\n.ace-clouds-midnight .ace_invalid.ace_illegal {\n  \n}\n\n.ace-clouds-midnight .ace_invalid.ace_deprecated {\n  \n}\n\n.ace-clouds-midnight .ace_support {\n  \n}\n\n.ace-clouds-midnight .ace_support.ace_function {\n  color:#E92E2E;\n}\n\n.ace-clouds-midnight .ace_function.ace_buildin {\n  \n}\n\n.ace-clouds-midnight .ace_string {\n  color:#5D90CD;\n}\n\n.ace-clouds-midnight .ace_string.ace_regexp {\n  \n}\n\n.ace-clouds-midnight .ace_comment {\n  color:#3C403B;\n}\n\n.ace-clouds-midnight .ace_comment.ace_doc {\n  \n}\n\n.ace-clouds-midnight .ace_comment.ace_doc.ace_tag {\n  \n}\n\n.ace-clouds-midnight .ace_variable {\n  \n}\n\n.ace-clouds-midnight .ace_variable.ace_language {\n  \n}\n\n.ace-clouds-midnight .ace_xml_pe {\n  \n}";d.importCssString(e),b.cssClass="ace-clouds-midnight"})</td></tr></tbody></table>
      </div>
      <div id="help">
        <strong>Note:</strong> See <a href="/wiki/TracBrowser">TracBrowser</a>
        for help on using the browser.
      </div>
      <div id="anydiff">
        <form action="/diff" method="get">
          <div class="buttons">
            <input type="hidden" name="new_path" value="/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js" />
            <input type="hidden" name="old_path" value="/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js" />
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
          <a rel="nofollow" href="/browser/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js?format=txt">Plain Text</a>
        </li><li class="last">
          <a rel="nofollow" href="/export/7591/seattle/trunk/repy/apps/tryrepy/web/js/ace/theme-clouds_midnight.js">Original Format</a>
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