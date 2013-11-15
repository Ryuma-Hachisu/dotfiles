<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: ruby-block.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=ruby-block.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: ruby-block.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=ruby-block.el" />
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
      title="Changes for ruby-block.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=ruby-block.el" /><meta name="viewport" content="width=device-width" />
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22ruby-block%5c.el%22">ruby-block.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/ruby-block.el">Download</a></p><pre><span class="comment">;;; ruby-block.el --- highlight matching block</span>

<span class="comment">;; Copyright (C) 2007-2013  khiker, shishi</span>

<span class="comment">;; Author: khiker &lt;khiker.mail+elisp@gmail.com&gt;</span>
<span class="comment">;; Keywords: languages, faces, ruby</span>

<span class="comment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="comment">;; it under the terms of the GNU General Public License as published by</span>
<span class="comment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="comment">;; any later version.</span>

<span class="comment">;; This file is distributed in the hope that it will be useful,</span>
<span class="comment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="comment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the</span>
<span class="comment">;; GNU General Public License for more details.</span>

<span class="comment">;; You should have received a copy of the GNU General Public License</span>
<span class="comment">;; along with GNU Emacs; see the file COPYING.	If not, write to</span>
<span class="comment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,</span>
<span class="comment">;; Boston, MA 02110-1301, USA.</span>

<span class="comment">;;; Commentary<span class="builtin">:</span></span>

<span class="comment">;;; Usage<span class="builtin">:</span></span>

<span class="comment">;; Add this line to your .emacs</span>
<span class="comment">;;</span>
<span class="comment">;; (<span class="keyword">require</span> '<span class="constant">ruby-block</span>)</span>
<span class="comment">;; (ruby-block-mode t)</span>
<span class="comment">;;</span>
<span class="comment">;; In addition, you can also add this line too.</span>
<span class="comment">;;</span>
<span class="comment">;; ;; do overlay</span>
<span class="comment">;; (setq ruby-block-highlight-toggle 'overlay)</span>
<span class="comment">;; ;; display to minibuffer</span>
<span class="comment">;; (setq ruby-block-highlight-toggle 'minibuffer)</span>
<span class="comment">;; ;; display to minibuffer and do overlay</span>
<span class="comment">;; (setq ruby-block-highlight-toggle t)</span>
<span class="comment">;;</span>
<span class="comment">;; Default is minibuffer.</span>
<span class="comment">;;</span>
<span class="comment">;; Tested on Emacs 23.3 and 24.0.90.</span>
<span class="comment">;; ;; Probably works 22.3 and 23.1 (not tested).</span>

<span class="comment">;;; Note<span class="builtin">:</span></span>

<span class="comment">;; A ruby-mode.el or enh-ruby-mode is necessary to use this package.</span>

<span class="comment">;;; Code<span class="builtin">:</span></span>

(<span class="keyword">require</span> '<span class="constant">ruby-mode</span>)

<span class="comment">;; Variables<span class="builtin">:</span></span>

(<span class="keyword">defconst</span> <span class="variable">ruby-block-version</span> <span class="string">"0.0.11"</span>
  <span class="string">"Ruby block package version."</span>)

(<span class="keyword">defconst</span> <span class="variable">ruby-block-keyword-list</span>
  (list <span class="string">"end"</span> <span class="string">"for"</span> <span class="string">"while"</span> <span class="string">"until"</span> <span class="string">"if"</span> <span class="string">"class"</span> <span class="string">"module"</span>
	<span class="string">"case"</span> <span class="string">"unless"</span> <span class="string">"def"</span> <span class="string">"begin"</span> <span class="string">"do"</span>)
  <span class="string">"Keyword for highlighting."</span>)

(<span class="keyword">defconst</span> <span class="variable">ruby-block-keyword-regex</span>
  <span class="string">"\\(end\\|for\\|while\\|until\\|if\\|class\\|module\\|case\\|unless\\|def\\|begin\\|do\\)"</span>
  <span class="string">"Rregular expression to look for correspondence."</span>)

(<span class="keyword">defgroup</span> <span class="type">ruby-block</span> nil
  <span class="string">"Ruby block"</span>
  <span class="builtin">:tag</span> <span class="string">"Ruby block"</span>
  <span class="builtin">:group</span> 'ruby-block)

(<span class="keyword">defcustom</span> <span class="variable">ruby-block-delay</span> 0.50
  <span class="string">"*Time in seconds to delay before showing a matching paren."</span>
  <span class="builtin">:type</span>	 'number
  <span class="builtin">:group</span> 'ruby-block)

(<span class="keyword">defcustom</span> <span class="variable">ruby-block-highlight-face</span> 'highlight
  <span class="string">"*Face for block highlighting."</span>
  <span class="builtin">:type</span>	 'face
  <span class="builtin">:group</span> 'ruby-block)

(<span class="keyword">defcustom</span> <span class="variable">ruby-block-highlight-toggle</span> 'minibuffer
  <span class="string">"*How do you display corresponding line.
Default is minibuffer. display to minibuffer.

The possible choice is as follows.

nil	   =&gt; nothing
minibuffer =&gt; minibuffer
overlay	   =&gt; overlay
t	   =&gt; minibuffer and overlay"</span>
  <span class="builtin">:type</span>	 '(choice (const <span class="builtin">:tag</span> <span class="string">"nothing"</span> nil)
		  (const <span class="builtin">:tag</span> <span class="string">"minibuffer"</span> minibuffer)
		  (const <span class="builtin">:tag</span> <span class="string">"overlay"</span> overlay)
		  (const <span class="builtin">:tag</span> <span class="string">"minibuffer and overlay"</span> t))
  <span class="builtin">:group</span> 'ruby-block)

(<span class="keyword">defvar</span> <span class="variable">ruby-block-timer</span> nil)

(<span class="keyword">defvar</span> <span class="variable">ruby-block-highlight-overlay</span> nil)


<span class="comment">;; Functions<span class="builtin">:</span></span>

(<span class="keyword">define-minor-mode</span> <span class="function">ruby-block-mode</span>
  <span class="string">"In ruby-mode, Displays the line where there is keyword corresponding
to END keyword. this is Minor mode for ruby-mode only."</span>
  <span class="builtin">:init-value</span> t
  <span class="builtin">:global</span> nil
  <span class="builtin">:keymap</span> nil
  <span class="builtin">:lighter</span> <span class="string">" RBlock"</span>
  (<span class="keyword elisp">if</span> ruby-block-mode
      (ruby-block-start-timer)
    (ruby-block-stop-timer)))

(<span class="keyword">defun</span> <span class="function">ruby-block-start-timer</span> ()
  <span class="string">"start timer."</span>
  (<span class="keyword cl">when</span> ruby-block-timer
    (cancel-timer ruby-block-timer))
  (setq ruby-block-timer
	(run-with-idle-timer ruby-block-delay t 'ruby-block-hook)))

(<span class="keyword">defun</span> <span class="function">ruby-block-stop-timer</span> ()
  <span class="string">"stop timer."</span>
  (<span class="keyword cl">when</span> ruby-block-timer
    (cancel-timer ruby-block-timer)
    (setq ruby-block-timer nil)))

(<span class="keyword">defun</span> <span class="function">ruby-block-hook</span> ()
  <span class="string">"When Major-mode is ruby-mode or enh-ruby-mode, this package is running."</span>
  (<span class="keyword elisp">if</span> (or (eq major-mode 'ruby-mode) (eq major-mode 'enh-ruby-mode))
      (<span class="keyword elisp">condition-case</span> err
	  (ruby-block-function)
	(<span class="warning">error</span>
	 (setq ruby-block-mode nil)
	 (message <span class="string">"Error: %S<span class="comment">; ruby-block-mode now disabled."</span> err)))</span>
    (setq ruby-block-mode nil)))

(<span class="keyword">defun</span> <span class="function">ruby-block-line-beginning-position</span> (pos)
  (<span class="keyword cl">when</span> pos
    (<span class="keyword elisp">save-excursion</span>
      (goto-char pos)
      (<span class="keyword elisp">let</span> ((xor '(<span class="keyword elisp">lambda</span> (a b) (and (or a b) (not (and a b)))))
	    (pos (point))
	    (count 0))
	(<span class="keyword elisp">while</span> (and (not (funcall xor (bobp) (eolp)))
		    (&gt; pos (point-min)))
	  (setq pos (1- pos))
	  (goto-char (1- (point))))
	<span class="comment">;; delete linefeed of start point.</span>
	(<span class="keyword cl">when</span> (and (eolp) (&gt;= (point-max) (1+ pos)))
	  (setq pos (1+ pos)))
	pos))))

(<span class="keyword">defun</span> <span class="function">ruby-block-line-end-position</span> (pos)
  (<span class="keyword cl">when</span> pos
    (<span class="keyword elisp">save-excursion</span>
      (goto-char pos)
      (<span class="keyword elisp">let</span> ((xor '(<span class="keyword elisp">lambda</span> (a b) (and (or a b) (not (and a b)))))
	    (pos (point)))
	(<span class="keyword elisp">while</span> (and (not (funcall xor (eobp) (eolp)))
		    (&gt;= (point-max) pos))
	  (setq pos (1+ pos))
	  (goto-char (1+ (point))))
	pos))))

(<span class="keyword">defun</span> <span class="function">ruby-block-function</span> ()
  <span class="string">"Point position's word decides behavior."</span>
  (<span class="keyword elisp">let</span> ((cur (current-word))
	(face    (get-text-property (point) 'face)))
    (<span class="keyword cl">when</span> (and (member cur '(<span class="string">"else"</span> <span class="string">"elsif"</span> <span class="string">"end"</span>))
	       (eq face 'font-lock-keyword-face))
      (<span class="keyword elisp">let</span>* ((pos (ruby-block-corresponding-position (point)))
	     (sp  (ruby-block-line-beginning-position pos))
	     (ep  (ruby-block-line-end-position pos)))
	(<span class="keyword cl">when</span> pos
	  <span class="comment">;; display line contents to minibuffer</span>
	  (<span class="keyword cl">when</span> (memq ruby-block-highlight-toggle '(t minibuffer))
	    (message <span class="string">"%d: %s"</span>
		     (1+ (count-lines (point-min) sp)) (buffer-substring sp ep)))
	  <span class="comment">;; do overlay</span>
	  (<span class="keyword cl">when</span> (memq ruby-block-highlight-toggle '(t overlay))
	    (ruby-block-do-highlight sp ep)))))))

(<span class="keyword">defun</span> <span class="function">ruby-block-stmt-if</span> (pos)
  (<span class="keyword elisp">save-excursion</span>
    (goto-char pos)
    (<span class="keyword elisp">let</span> ((status 'skip))
      (<span class="keyword elisp">while</span> (and (not (bolp))
		  (eq status 'skip))
	(forward-char -1)
	(<span class="keyword elisp">let</span> ((ch (char-after)))
	  (<span class="keyword elisp">cond</span>
	   ((memq ch '(?\n ?\r ?\())
	    (setq status t))
	   ((memq ch '(32 \t))
	    (setq status 'skip))
	   (t
	    (setq status nil)))))
      (<span class="keyword cl">when</span> (eq status 'skip)
	(setq status t))
      status)))

(<span class="keyword">defun</span> <span class="function">ruby-block-corresponding-position</span> (pos)
  <span class="string">"Get point of corresponding line."</span>
  (<span class="keyword elisp">save-excursion</span>
    (goto-char pos)
    (<span class="keyword elisp">let</span> ((key 1) pos face cur)
      (<span class="keyword elisp">while</span> (and (&gt; key 0)
		  (re-search-backward ruby-block-keyword-regex nil t))
	(setq pos (match-beginning 1)
	      face (get-text-property pos 'face)
	      cur (current-word))
	(<span class="keyword cl">when</span> (and (eq face 'font-lock-keyword-face)
		   (not (string= cur <span class="string">"elsif"</span>))
		   (member cur ruby-block-keyword-list)
		   <span class="comment">;; case: STMT if (or unless, while, untill) EXPR</span>
		   (<span class="keyword elisp">cond</span>
		    ((member cur '(<span class="string">"if"</span> <span class="string">"unless"</span> <span class="string">"while"</span> <span class="string">"until"</span>))
		     (ruby-block-stmt-if pos))
		    (t
		     t)))
	  (<span class="keyword elisp">cond</span>
	   ((and (string= cur <span class="string">"end"</span>))
	    (setq key (1+ key)))
	   (t
	    (setq key (1- key))))))
      (<span class="keyword cl">when</span> (= key 0)
	pos))))

(<span class="keyword">defun</span> <span class="function">ruby-block-do-highlight</span> (beg end)
  <span class="string">"Do overlay corresponding line."</span>
  (<span class="keyword elisp">if</span> ruby-block-highlight-overlay
      (move-overlay  ruby-block-highlight-overlay beg end)
    (setq ruby-block-highlight-overlay (make-overlay beg end)))
  (overlay-put ruby-block-highlight-overlay
	       'face ruby-block-highlight-face)
  (add-hook 'pre-command-hook 'ruby-block-highlight-done))

(<span class="keyword">defun</span> <span class="function">ruby-block-highlight-done</span> ()
  <span class="string">"After do overlay, restore the line to original color."</span>
  (remove-hook 'pre-command-hook 'ruby-block-highlight-done)
  (<span class="keyword elisp">if</span> ruby-block-highlight-overlay
      (delete-overlay ruby-block-highlight-overlay)))

(<span class="keyword">defun</span> <span class="function">ruby-block-highlight-toggle</span> ()
  <span class="string">"Switch on/off for ruby-block-mode."</span>
  (interactive)
  (<span class="keyword elisp">if</span> ruby-block-highlight-toggle
      (setq ruby-block-highlight-toggle nil)
    (setq ruby-block-highlight-toggle t)))

(<span class="keyword">provide</span> '<span class="constant">ruby-block</span>)

<span class="comment">;; Local Variables<span class="builtin">:</span></span>
<span class="comment">;; Coding: utf-8</span>
<span class="comment">;; End<span class="builtin">:</span></span>

<span class="comment">;;; ruby-block.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=ruby-block.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_ruby-block.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=ruby-block.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=ruby-block.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=ruby-block.el">Administration</a></span><span class="time"><br /> Last edited 2013-09-24 00:21 UTC by <a class="author" title="from 124x33x173x210.ap124.ftth.ucom.ne.jp" href="http://www.emacswiki.org/emacs/shishi">shishi</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=ruby-block.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
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
