<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: anything-c-shell-history.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=anything-c-shell-history.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: anything-c-shell-history.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything-c-shell-history.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for anything-c-shell-history.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything-c-shell-history.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
        var oldOnload = window.onload;
        window.onload = function ( e ) {
          oldOnload( e );
          window[fnc]();
        };
      }
      else
        window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
        || outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
        var divs = document.getElementsByTagName('div');
        for (var i = 0; i < divs.length; i++) {
          if (divs[i].getAttribute('class') == 'toc') {
            toc = divs[i];
            break;
          }
        }
      }

      if (!toc) {
        var h2 = document.getElementsByTagName('h2')[0];
        if (h2) {
          toc = document.createElement('div');
          toc.setAttribute('class', 'toc');
          h2.parentNode.insertBefore(toc, h2);
        }
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22anything-c-shell-history%5c.el%22">anything-c-shell-history.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/anything-c-shell-history.el">Download</a></p><pre><span class="comment">;;; anything-c-shell-history.el --- shell history anything.el interface</span>

<span class="comment">;; Copyright (C) 2008-2009 by 101000code/101000LAB, all rights reserved.</span>
<span class="comment">;; Copyright (C) 2009, IMAKADO, all rights reserved.</span>
<span class="comment">;;</span>
<span class="comment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 2 of the License, or</span>
<span class="comment">;; (at your option) any later version.</span>
<span class="comment">;;</span>
<span class="comment">;; This program is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="comment">;; GNU General Public License for more details.</span>
<span class="comment">;;</span>
<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with this program; if not, write to the Free Software</span>
<span class="comment">;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA</span>
<span class="comment">;;</span>
<span class="comment">;; Version: 0.0.8</span>
<span class="comment">;; Author: k1LoW (Kenichirou Oyama), &lt;k1lowxb [at] gmail [dot] com&gt; &lt;k1low [at] 101000lab [dot] org&gt;</span>
<span class="comment">;;         IMAKADO</span>
<span class="comment">;; URL: http<span class="builtin">://code</span>.101000lab.org, http<span class="builtin">://trac</span>.codecheck.in http<span class="builtin">://d</span>.hatena.ne.jp/IMAKADO</span>

<span class="comment">;;; Commentary<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; This package use `<span class="constant important">anything</span>' as a interface to execute *sh_history.</span>
<span class="comment">;;</span>
<span class="comment">;; You can make this package integrate with `<span class="constant important">anything</span>',</span>
<span class="comment">;; just setup like below<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; (setq anything-sources</span>
<span class="comment">;;       (list</span>
<span class="comment">;;        anything-c-source-shell-history</span>
<span class="comment">;;        ))</span>

<span class="comment">;;; Installation<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; Put anything-etags.el to your load-path.</span>
<span class="comment">;; The load-path is usually ~/elisp/.</span>
<span class="comment">;; It's set in your ~/.emacs like this<span class="builtin">:</span></span>
<span class="comment">;; (add-to-list 'load-path (expand-file-name <span class="string">"~/elisp"</span>))</span>
<span class="comment">;;</span>
<span class="comment">;; And the following to your ~/.emacs startup file.</span>
<span class="comment">;;</span>
<span class="comment">;; (<span class="keyword">require</span> '<span class="constant">anything-c-shell-history</span>)</span>
<span class="comment">;;</span>
<span class="comment">;; No need more.</span>

<span class="comment">;;; Change log<span class="builtin">:</span></span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.8</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * Applied IMAKADO's big patch to New Action.</span>
<span class="comment">;;      * New Action Execute History Asynchronous whitch excecute command asynchronous.</span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.7</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * Fix doc.</span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.6</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * Test support .zsh_history.</span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.5</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * display current directory, when <span class="string">"Edit And Execute"</span></span>
<span class="comment">;;      * Refactor code.</span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.4</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * support shell-history.el http<span class="builtin">://www</span>.emacswiki.org/cgi-bin/wiki/download/shell-history.el</span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.3</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * Refactor code. ref http<span class="builtin">://d</span>.hatena.ne.jp/rubikitch/20080908/anything</span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.2</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * New anything action <span class="string">"Edit And Execute"</span> which can edit and execute .*sh_history.</span>
<span class="comment">;;</span>
<span class="comment">;; 0.0.1</span>
<span class="comment">;;   * k1LoW<span class="builtin">:</span></span>
<span class="comment">;;      * First released.</span>

<span class="comment">;;; TODO</span>
<span class="comment">;; use ansi-term ?</span>

<span class="comment">;;; Code<span class="builtin">:</span></span>

(<span class="keyword">require</span> '<span class="constant">anything</span>)
(<span class="keyword">require</span> '<span class="constant">timer</span>)
(<span class="keyword">defvar</span> <span class="variable">anything-c-shell-history-file</span> <span class="string">"~/.bash_history"</span>)

(<span class="keyword">defun</span> <span class="function">anything-c-shell-history-command</span>()
  <span class="string">"Make command"</span>
  (<span class="keyword elisp">if</span> (string-match <span class="string">"zsh_history"</span> anything-c-shell-history-file)
      (concat <span class="string">"cut -d '<span class="comment">;' -f 2 "</span> anything-c-shell-history-file)</span>
    (concat <span class="string">"less "</span> anything-c-shell-history-file)))

(<span class="keyword">defvar</span> <span class="variable">anything-c-source-shell-history</span>
  '((name . <span class="string">"Shell History"</span>)
    (init
     . (<span class="keyword elisp">lambda</span> ()
         (call-process-shell-command
          (anything-c-shell-history-command) nil (anything-candidate-buffer 'global))))
    (candidates-in-buffer)
    (search-from-end)
    (action
     (<span class="string">"Execute History"</span> . (<span class="keyword elisp">lambda</span> (candidate)
                            (<span class="keyword elisp">save-excursion</span>
                              (message <span class="string">"wait...."</span>)
                              (call-process-shell-command candidate nil (get-buffer-create <span class="string">"*Shell Command*"</span>))
                              (<span class="keyword elisp">if</span> (<span class="keyword">featurep</span> '<span class="constant">shell-history</span>)
                                  (add-to-shell-history candidate))
                              (switch-to-buffer <span class="string">"*Shell Command*"</span>)
                              (message (delete-and-extract-region (point-min) (point-max)))
                              (set-buffer-modified-p (buffer-modified-p))
                              (kill-buffer <span class="string">"*Shell Command*"</span>))))
     (<span class="string">"Edit and Execute"</span> . (<span class="keyword elisp">lambda</span> (candidate)
                             (<span class="keyword elisp">let</span> ((command <span class="string">""</span>))
                               (<span class="keyword elisp">save-excursion</span>
                                 (setq command (read-from-minibuffer (concat <span class="string">"command:("</span> default-directory <span class="string">") "</span>) candidate))
                                 (message <span class="string">"wait...."</span>)
                                 (call-process-shell-command command nil (get-buffer-create <span class="string">"*Shell Command*"</span>))
                                 (<span class="keyword elisp">if</span> (<span class="keyword">featurep</span> '<span class="constant">shell-history</span>)
                                     (add-to-shell-history command))
                                 (switch-to-buffer <span class="string">"*Shell Command*"</span>)
                                 (message (delete-and-extract-region (point-min) (point-max)))
                                 (set-buffer-modified-p (buffer-modified-p))
                                 (kill-buffer <span class="string">"*Shell Command*"</span>)))))
     (<span class="string">"Execute History Asynchronous"</span> . anything-c-shell-history-execute-history-async))))

(<span class="keyword">defun</span> <span class="function">anything-c-shell-history-execute-history-async</span> (candidate)
  (anything-c-shell-history-async-do
   <span class="builtin">:command</span> candidate
   <span class="builtin">:buffer-name</span> <span class="string">"*Shell Command*"</span>
   <span class="builtin">:args</span> nil
   <span class="builtin">:callback</span> (<span class="keyword elisp">lambda</span> ()
               (kill-new (format <span class="string">"%s"</span> (current-buffer)))
               (run-with-timer <span class="comment">;; called after with-current-buffer... in `<span class="constant important">anything-c-shell-history-async-do</span>'</span>
                0.1
                nil
                (switch-to-buffer (current-buffer))))))

(<span class="keyword">defun*</span> <span class="function">anything-c-shell-history-async-do</span>
    (<span class="type">&amp;key</span> command args buffer-name
          (callback 'identity)
          (errorback (<span class="keyword elisp">lambda</span>() (message (buffer-string)))))
  (<span class="keyword cl">lexical-let</span> ((buf (get-buffer-create buffer-name))
                (callback callback)
                (errorback errorback))
    (<span class="keyword cl">lexical-let</span>
      ((sentinel (<span class="keyword elisp">lambda</span> (proc event)
         (<span class="keyword elisp">cond</span> ((and (string= event <span class="string">"finished\n"</span>)
                     (= (process-exit-status proc) 0))
                (<span class="keyword elisp">with-current-buffer</span> buf
                  (funcall callback)))
               ((and (string= event <span class="string">"finished\n"</span>)
                     (/= (process-exit-status proc) 0))
                (<span class="keyword elisp">with-current-buffer</span> buf
                  (funcall errorback)))))))
      (set-process-sentinel (apply 'start-process-shell-command command buf command args) sentinel))))

(<span class="keyword">provide</span> '<span class="constant">anything-c-shell-history</span>)

<span class="comment">;;; Code ends</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=anything-c-shell-history.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_anything-c-shell-history.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=anything-c-shell-history.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=anything-c-shell-history.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=anything-c-shell-history.el">Administration</a></span><span class="time"><br /> Last edited 2013-08-24 12:06 UTC by <a class="author" title="from 178-83-163-103.dynamic.hispeed.ch" href="http://www.emacswiki.org/emacs/AlexSchroeder">AlexSchroeder</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=anything-c-shell-history.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
